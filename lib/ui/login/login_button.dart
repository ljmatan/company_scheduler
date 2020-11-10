import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/logic/login/login_api.dart';
import 'package:company_scheduler/ui/login/bloc/textfield_enabled.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final String username, password;

  LoginButton({
    @required this.username,
    @required this.password,
  });

  @override
  State<StatefulWidget> createState() {
    return _LoginButtonState();
  }
}

class _LoginButtonState extends State<LoginButton> {
  bool _verifyingInfo = false;

  void _changeState(bool) => setState(() {
        _verifyingInfo = bool;
        TextFieldEnabled.change(!bool);
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(22),
        ),
        child: SizedBox(
          height: 48,
          width: 100,
          child: Center(
            child: _verifyingInfo
                ? SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  )
                : Text(
                    Internationalization.login('login'),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
      onTap: () async {
        FocusScope.of(context).unfocus();
        _changeState(true);
        try {
          final Map response =
              await LoginAPI.login(widget.username, widget.password);
          if (response['status'] == null) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => null),
              (Route<dynamic> route) => false,
            );
          } else if (response['status'] == 400) {
            _changeState(false);
          } else
            throw ErrorDescription('Unknown error');
        } catch (e) {
          _changeState(false);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            'Greška: ' + e.toString(),
          )));
        }
      },
    );
  }
}
