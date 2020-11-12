import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label, url;

  ActionButton({
    @required this.icon,
    @required this.label,
    @required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                label,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () async {
        if (await canLaunch(url))
          await launch(url);
        else
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Unavailable',
              ),
            ),
          );
      },
    );
  }
}
