import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/logic/local_storage/prefs.dart';
import 'package:company_scheduler/logic/login/login_api.dart';
import 'package:company_scheduler/ui/dashboard/dashboard_screen.dart';
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
          borderRadius: BorderRadius.circular(25),
        ),
        child: SizedBox(
          height: 50,
          width: 140,
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
      onTap: _verifyingInfo
          ? null
          : () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => DashboardScreen()),
                (Route<dynamic> route) => false,
              ),
      /*() async {
              FocusScope.of(context).unfocus();
              _changeState(true);
              try {
                final Map response =
                    await LoginAPI.login(widget.username, widget.password);
                if (response['status'] == null) {
                  await Prefs.setLocalData(
                    response['username'],
                    response['password'],
                    response['id'],
                  );
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                    (Route<dynamic> route) => false,
                  );
                } else if (response['status'] == 400) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text(Internationalization.login('incorrect data'))));
                  _changeState(false);
                } else
                  throw ErrorDescription(
                      Internationalization.login('unknown error'));
              } catch (e) {
                _changeState(false);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                  Internationalization.login('error') + ': ' + e.toString(),
                )));
              }
            },*/
    );
  }
}
