import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/ui/contact/contact_entry.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class ContactScreen extends StatelessWidget {
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
              autofocus: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey[50],
                  Colors.grey[50].withOpacity(0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SizedBox(
              height: 16,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height -
                119 -
                kToolbarHeight -
                MediaQuery.of(context).viewInsets.bottom,
            child: FutureBuilder(
              future: Future.delayed(
                const Duration(seconds: 1),
                () => [],
              ),
              builder: (context, contacts) => contacts.hasData
                  ? contacts.data.isEmpty
                      ? Center(child: Text('No contacts found'))
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
    );
  }
}
