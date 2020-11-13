import 'dart:io';
import 'package:company_scheduler/data/user_info.dart';
import 'package:company_scheduler/logic/api/api_helper.dart';
import 'package:company_scheduler/logic/local_storage/prefs.dart';
import 'package:company_scheduler/other/scroll_behavior.dart';
import 'package:company_scheduler/ui/dashboard/dashboard_screen.dart';
import 'package:company_scheduler/ui/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Enable the use of self-signed SSL certificate
  HttpOverrides.global = CustomHttpOverrides();
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
        fontFamily: 'Tahoma',
        primaryColor: Colors.blue.shade300,
        accentColor: Colors.blue.shade300,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 2,
          titleSpacing: 0,
          color: Colors.white,
          textTheme: const TextTheme(
            headline6: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
      home: UserInfo.id == null ? LoginScreen() : DashboardScreen(),
      // Removes overscroll effect
      builder: (context, child) => ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: child,
      ),
    );
  }
}
