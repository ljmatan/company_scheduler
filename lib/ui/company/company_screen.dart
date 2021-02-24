import 'package:company_scheduler/logic/api/company/company_api.dart';
import 'package:company_scheduler/logic/api/company/company_model.dart';
import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/ui/company/company_entry.dart';
import 'package:company_scheduler/ui/other/scroll_overflow.dart';
import 'package:company_scheduler/ui/shared/custom_spinning_indicator.dart';
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
                    builder: (context, companies) => companies
                                        .connectionState ==
                                    ConnectionState.active &&
                                text.data.trim().length > 2 ||
                            companies.connectionState ==
                                    ConnectionState.waiting &&
                                text.data.trim().length > 2
                        ? Center(child: CustomSpinningIndicator())
                        : companies.hasError ||
                                companies.hasData &&
                                    companies.data.isNotEmpty &&
                                    companies.data[0]['status'] == 400
                            ? Center(
                                child: Text(
                                  Internationalization.misc('error') +
                                      ': ' +
                                      (companies.hasData &&
                                              companies.data.isNotEmpty &&
                                              companies.data[0]['status'] == 400
                                          ? companies.data[0]['message']
                                          : companies.error.toString()),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : !companies.hasData || companies.data.isEmpty
                                ? Center(
                                    child: Text(
                                      text.data == ''
                                          ? Internationalization.search(
                                              'enter a search term')
                                          : text.data.trim().length < 3
                                              ? Internationalization.search(
                                                  'enter at least 3 characters')
                                              : Internationalization.search(
                                                  'no results'),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                : ListView(
                                    children: [
                                      const SizedBox(height: 16),
                                      for (var company in companies.data)
                                        CompanyEntry(
                                          company: Company.fromJson(company),
                                        ),
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
