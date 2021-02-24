import 'package:company_scheduler/ui/calendar/calendar_screen.dart';
import 'package:company_scheduler/ui/company/company_screen.dart';
import 'package:company_scheduler/ui/contact/contact_screen.dart';
import 'package:company_scheduler/ui/dashboard/dashboard_button.dart';
import 'package:company_scheduler/ui/dashboard/exit_app_dialog.dart';
import 'package:company_scheduler/ui/task/task_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: ListView(
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
            label: 'company',
            route: CompanyScreen(),
          ),
          DashboardButton(
            label: 'task',
            route: TaskScreen(),
          ),
          DashboardButton(
            label: 'calendar',
            route: CalendarScreen(),
          ),
        ],
      ),
      onWillPop: () async {
        bool _willPop;

        await showDialog(
          context: context,
          builder: (context) => ExitAppDialog(),
        ).then((value) => _willPop = value ?? false);

        return _willPop;
      },
    );
  }
}
