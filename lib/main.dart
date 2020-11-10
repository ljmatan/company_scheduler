import 'package:company_scheduler/data/user_info.dart';
import 'package:company_scheduler/logic/local_storage/prefs.dart';
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
      theme: ThemeData(
        cursorColor: Colors.black87,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UserInfo.id == null ? LoginScreen() : null,
    );
  }
}
