import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class CompanyScreen extends StatelessWidget {
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
            Text(Internationalization.dash('companies')),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 115 - kToolbarHeight,
            child: FutureBuilder(
              future: Future.delayed(
                const Duration(seconds: 1),
                () => [],
              ),
              builder: (context, contacts) => contacts.hasData
                  ? contacts.data.isEmpty
                      ? Center(child: Text('No results'))
                      : ListView.builder(
                          itemCount: contacts.data.length,
                          itemBuilder: (context, index) => null,
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
