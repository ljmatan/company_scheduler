import 'package:company_scheduler/ui/company/company_screen.dart';
import 'package:company_scheduler/ui/contact/contact_screen.dart';
import 'package:company_scheduler/ui/dashboard/dashboard_button.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        reverse: true,
        children: [
          const SizedBox(height: 20),
          // To add a new button to the bottom of the screen, add DashboardButton object here
          DashboardButton(
            label: 'contact',
            // Screen pushed on tap
            route: ContactScreen(),
          ),
          DashboardButton(
            label: 'task',
            route: null,
          ),
          DashboardButton(
            label: 'company',
            route: CompanyScreen(),
          ),
          DashboardButton(
            label: 'calendar',
            route: null,
          ),
        ],
      ),
    );
  }
}
