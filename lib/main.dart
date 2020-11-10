import 'package:company_scheduler/data/user_info.dart';
import 'package:company_scheduler/logic/local_storage/prefs.dart';
import 'package:company_scheduler/other/scroll_behavior.dart';
import 'package:company_scheduler/ui/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Init local data storage
  await Prefs.init();
  // Check if user info is stored on the device
  Prefs.getLocalData();
  runApp(CompanyScheduler());
}

class CompanyScheduler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Company Scheduler',
      theme: ThemeData(fontFamily: 'Tahoma'),
      home: UserInfo.id == null ? LoginScreen() : null,
      builder: (context, child) => ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: child,
      ),
    );
  }
}
