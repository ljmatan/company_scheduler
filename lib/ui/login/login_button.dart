import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/logic/local_storage/prefs.dart';
import 'package:company_scheduler/logic/api/login/login_api.dart';
import 'package:company_scheduler/ui/login/bloc/textfield_enabled.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController usernameController, passwordController;
  final AnimationController animationController;

  LoginButton({
    @required this.usernameController,
    @required this.passwordController,
    @required this.animationController,
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        child: DecoratedBox(
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
            : () async {
                FocusScope.of(context).unfocus();
                _changeState(true);
                try {
                  final Map response = await LoginAPI.login(
                    widget.usernameController.text,
                    widget.passwordController.text,
                  );
                  if (response['id'] != null) {
                    await Prefs.setLocalData(
                      widget.usernameController.text,
                      widget.passwordController.text,
                      response['id'].toString(),
                    );
                    widget.animationController.forward();
                  } else if (response['status'] == 400) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(Internationalization.misc('error') +
                            ': ' +
                            response['message'])));
                    _changeState(false);
                  } else
                    throw Internationalization.login('unknown error');
                } catch (e) {
                  _changeState(false);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    Internationalization.misc('error') + ': ' + e.toString(),
                  )));
                }
              },
      ),
    );
  }
}
