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
                        ? Future.value(
                            [
                              {
                                "entityManager": null,
                                "id": 1000,
                                "name": "Nikola Djakovic",
                                "address": {
                                  "entityManager": null,
                                  "id": 21600,
                                  "street": "Ulica 1",
                                  "city": "Belgrade",
                                  "houseno": "40",
                                  "flatno": "13",
                                  "phone1": "3931173",
                                  "phone2": "",
                                  "mobile1": "(064) 367",
                                  "mobile2": "",
                                  "email1": "",
                                  "email2": "",
                                  "note": "Test"
                                },
                                "client": {
                                  "entityManager": null,
                                  "id": 1,
                                  "name": "Input doo",
                                  "account": {
                                    "entityManager": null,
                                    "id": 1,
                                    "name": "Input doo",
                                    "registerTime": "20:58:53",
                                    "active": true
                                  },
                                  "clientType": {
                                    "entityManager": null,
                                    "id": 1,
                                    "name": "Parner",
                                    "active": true,
                                    "account": 1
                                  },
                                  "address": {
                                    "entityManager": null,
                                    "id": 0,
                                    "street": "",
                                    "city": "1",
                                    "houseno": "",
                                    "flatno": "",
                                    "phone1": "",
                                    "phone2": "",
                                    "mobile1": "",
                                    "mobile2": "",
                                    "email1": null,
                                    "email2": null,
                                    "note": ""
                                  },
                                  "clientTypeDTO": null
                                },
                                "contactType": {
                                  "entityManager": null,
                                  "id": 300,
                                  "name": "Podrska",
                                  "active": false,
                                  "account": {
                                    "entityManager": null,
                                    "id": 1,
                                    "name": "Input doo",
                                    "registerTime": "20:58:53",
                                    "active": true
                                  }
                                },
                                "attributes": null
                              },
                            ],
                          )
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
                        : contacts.hasError
                            ? Center(
                                child: Text(
                                  'Error: ' + contacts.error.toString(),
                                ),
                              )
                            : contacts.hasData
                                ? contacts.data.isEmpty
                                    ? Center(
                                        child: Text(
                                          text.data == ''
                                              ? 'Enter a search term'
                                              : text.data.length < 3
                                                  ? 'Enter at least 3 characters'
                                                  : 'No contacts found',
                                        ),
                                      )
                                    : ListView.builder(
                                        itemCount: contacts.data.length,
                                        itemBuilder: (context, i) =>
                                            ContactEntry(
                                          contact: Contact.fromJson(
                                            contacts.data[i],
                                          ),
                                        ),
                                      )
                                : Center(
                                    child: SizedBox(
                                      height: 64,
                                      width: 64,
                                      child: CircularProgressIndicator(),
                                    ),
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
