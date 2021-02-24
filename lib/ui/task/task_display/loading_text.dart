import 'dart:async';
import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:flutter/material.dart';

class LoadingText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingTextState();
  }
}

class _LoadingTextState extends State<LoadingText> {
  String _text = Internationalization.task('loading');

  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(milliseconds: 200),
      (_) => setState(
        () {
          switch (_text.length) {
            case 7:
              {
                _text = Internationalization.task('loading') + '.';
              }
              break;
            case 8:
              {
                _text = Internationalization.task('loading') + '..';
              }
              break;
            case 9:
              {
                _text = Internationalization.task('loading') + '...';
              }
              break;
            default:
              {
                _text = Internationalization.task('loading');
              }
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(_text);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
