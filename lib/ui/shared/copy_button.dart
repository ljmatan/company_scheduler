import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/ui/shared/bloc/copied.dart';
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
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Copied.stream,
      builder: (context, copied) => copied.hasData &&
              copied.data == widget.details
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
                    Internationalization.results('copied'),
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
                await Clipboard.setData(ClipboardData(text: widget.details));
                Copied.update(widget.details);
              },
            ),
    );
  }
}
