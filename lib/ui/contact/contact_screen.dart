import 'dart:async';
import 'package:company_scheduler/logic/api/contact/contact_api.dart';
import 'package:company_scheduler/logic/api/models/contact_model.dart';
import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/ui/contact/contact_entry.dart';
import 'package:company_scheduler/ui/other/scroll_overflow.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class ContactScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContactScreenState();
  }
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final StreamController _textStreamController = StreamController.broadcast();

  Future<void> _search(String term) async => await ContactAPI.getContacts(term);

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
            Text(Internationalization.dash('contact')),
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
                    future: text.data.length < 3
                        ? Future.value([])
                        : _search(text.data),
                    builder: (context, contacts) => contacts.connectionState ==
                                ConnectionState.active ||
                            contacts.connectionState == ConnectionState.waiting
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
                            : contacts.data.isEmpty
                                ? Center(
                                    child: Text(
                                      text.data == ''
                                          ? 'Enter a search term'
                                          : text.data.length < 3
                                              ? 'Enter at least 3 characters'
                                              : 'No contacts found',
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                : ListView(
                                    children: [
                                      const SizedBox(height: 16),
                                      for (var contact in contacts.data)
                                        ContactEntry(
                                          contact: Contact.fromJson(contact),
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
