import 'dart:async';

import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/ui/contact/contact_entry.dart';
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
          SizedBox(
            height: MediaQuery.of(context).size.height -
                103 -
                kToolbarHeight -
                MediaQuery.of(context).viewInsets.bottom,
            child: Stack(
              children: [
                StreamBuilder(
                  stream: _textStreamController.stream,
                  initialData: '',
                  builder: (context, text) => FutureBuilder(
                    future: Future.delayed(
                      const Duration(seconds: 1),
                      () => [],
                    ),
                    builder: (context, contacts) => contacts.hasData
                        ? contacts.data.isEmpty
                            ? Center(
                                child: Text(
                                  text.data == ''
                                      ? 'Enter a name'
                                      : 'No contacts found',
                                ),
                              )
                            : ListView.builder(
                                itemCount: contacts.data.length,
                                itemBuilder: (context, index) => ContactEntry(),
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
