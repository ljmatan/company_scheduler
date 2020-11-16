import 'package:company_scheduler/ui/task/add_task/info_entry/info_entry.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class AddTaskScreen extends StatelessWidget {
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
            Text('New task'),
          ],
        ),
      ),
      body: InfoEntry(),
    );
  }
}
