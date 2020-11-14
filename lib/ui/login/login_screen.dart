import 'package:company_scheduler/logic/local_storage/data/user_info.dart';
import 'package:company_scheduler/ui/login/bloc/textfield_enabled.dart';
import 'package:company_scheduler/ui/login/login_button.dart';
import 'package:company_scheduler/ui/login/password_field.dart';
import 'package:company_scheduler/ui/login/username_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final AnimationController animationController;

  LoginScreen({@required this.animationController});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController =
      TextEditingController(text: UserInfo.username ?? '');
  final TextEditingController _passwordController =
      TextEditingController(text: UserInfo.password ?? '');

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  16,
                  16 + MediaQuery.of(context).padding.top,
                  16,
                  16,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: kElevationToShadow[1],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top + 16),
                        child: FlutterLogo(
                          size: MediaQuery.of(context).size.width * 0.4,
                        ),
                        // TODO: Replace FlutterLogo with below once logo had been appropriated
                        /*Image.asset(
                          'assets/logo.png',
                          width: MediaQuery.of(context).size.width * 0.5,
                          fit: BoxFit.cover,
                        ),*/
                      ),
                      UsernameField(controller: _usernameController),
                      PasswordField(controller: _passwordController),
                      LoginButton(
                        username: _usernameController.text,
                        password: _passwordController.text,
                        animationController: widget.animationController,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    TextFieldEnabled.dispose();
    super.dispose();
  }
}
