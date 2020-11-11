import 'package:company_scheduler/ui/login/bloc/textfield_enabled.dart';
import 'package:company_scheduler/ui/login/login_button.dart';
import 'package:company_scheduler/ui/login/password_field.dart';
import 'package:company_scheduler/ui/login/username_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).viewInsets.bottom,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(size: MediaQuery.of(context).size.width * 0.4),
                // TODO: Replace FlutterLogo with below once logo had been appropriated
                /*Image.asset(
                    'assets/logo.png',
                    width: MediaQuery.of(context).size.width * 0.5,
                    fit: BoxFit.cover,
                  ),*/
                UsernameField(controller: _usernameController),
                PasswordField(controller: _passwordController),
                LoginButton(
                  username: _usernameController.text,
                  password: _passwordController.text,
                ),
              ],
            ),
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
