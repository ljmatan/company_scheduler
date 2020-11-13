import 'package:flutter/material.dart';

class ExitAppDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Material(
          color: Colors.white,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 26),
                  child: Text(
                    'Exit the app?',
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'Yes',
                        style: const TextStyle(color: Colors.white),
                      ),
                      onPressed: () => Navigator.pop(context, true),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: FlatButton(
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          'No',
                          style: const TextStyle(color: Colors.white),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
