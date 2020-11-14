import 'dart:async';

import 'package:flutter/material.dart';

class LoadingText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingTextState();
  }
}

class _LoadingTextState extends State<LoadingText> {
  String _text = 'Loading';

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
                _text = 'Loading.';
              }
              break;
            case 8:
              {
                _text = 'Loading..';
              }
              break;
            case 9:
              {
                _text = 'Loading...';
              }
              break;
            default:
              {
                _text = 'Loading';
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
