import 'package:company_scheduler/logic/api/company/company_api.dart';
import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/ui/other/scroll_overflow.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'dart:async';

class CompanyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CompanyScreenState();
  }
}

class _CompanyScreenState extends State<CompanyScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final StreamController _textStreamController = StreamController.broadcast();

  Future<void> _search(String term) async =>
      await CompanyAPI.getCompanies(term);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            Text(Internationalization.dash('company')),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: TextField(
              controller: _textEditingController,
              autofocus: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (text) => _textStreamController.add(text),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                StreamBuilder(
                  stream: _textStreamController.stream,
                  initialData: '',
                  builder: (context, text) => FutureBuilder(
                    future: text.data.trim().length < 3
                        ? Future.value([])
                        : _search(text.data.trim()),
                    builder: (context, contacts) => contacts.connectionState ==
                                    ConnectionState.active &&
                                text.data.trim().length > 2 ||
                            contacts.connectionState ==
                                    ConnectionState.waiting &&
                                text.data.trim().length > 2
                        ? Center(
                            child: SizedBox(
                              height: 64,
                              width: 64,
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : contacts.hasError ||
                                contacts.hasData &&
                                    contacts.data.isNotEmpty &&
                                    contacts.data[0]['status'] == 400
                            ? Center(
                                child: Text(
                                  'Error: ' +
                                      (contacts.hasData &&
                                              contacts.data.isNotEmpty &&
                                              contacts.data[0]['status'] == 400
                                          ? contacts.data[0]['message']
                                          : contacts.error.toString()),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : !contacts.hasData || contacts.data.isEmpty
                                ? Center(
                                    child: Text(
                                      text.data == ''
                                          ? 'Enter a search term'
                                          : text.data.trim().length < 3
                                              ? 'Enter at least 3 characters'
                                              : 'No contacts found',
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                : ListView(
                                    children: [
                                      const SizedBox(height: 16),
                                      for (var contact in contacts.data) null,
                                    ],
                                  ),
                  ),
                ),
                ScrollOverflowEffect(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _textStreamController.close();
    super.dispose();
  }
}
