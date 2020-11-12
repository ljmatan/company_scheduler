import 'package:company_scheduler/ui/contact/contact_display/button_row/info_entry/bloc/copied.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyButton extends StatefulWidget {
  final String details;

  CopyButton({@required this.details});

  @override
  State<StatefulWidget> createState() {
    return _CopyButtonState();
  }
}

class _CopyButtonState extends State<CopyButton> {
  bool _copied = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Copied.stream,
      initialData: false,
      builder: (context, copied) {
        _copied = false;
        return StatefulBuilder(
          builder: (context, newState) => _copied
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                      child: Text(
                        'Copied',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              : FlatButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    widget.details,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    await Clipboard.setData(
                        ClipboardData(text: widget.details));
                    Copied.update();
                    Future.delayed(
                      const Duration(milliseconds: 50),
                      () => newState(() => _copied = true),
                    );
                  },
                ),
        );
      },
    );
  }
}
