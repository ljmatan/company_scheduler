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
            label: 'contacts',
            route: null,
          ),
          DashboardButton(
            label: 'tasks',
            route: null,
          ),
          DashboardButton(
            label: 'company',
            route: null,
          ),
          DashboardButton(
            label: 'calendar',
            // Screen pushed onTap
            route: null,
          ),
        ],
      ),
    );
  }
}
