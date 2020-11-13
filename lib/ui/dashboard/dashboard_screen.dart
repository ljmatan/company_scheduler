import 'dart:ui';
import 'dart:math' as math;
import 'package:company_scheduler/ui/calendar/calendar_screen.dart';
import 'package:company_scheduler/ui/company/company_screen.dart';
import 'package:company_scheduler/ui/contact/contact_screen.dart';
import 'package:company_scheduler/ui/dashboard/dashboard_button.dart';
import 'package:company_scheduler/ui/task/task_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: ClipRRect(
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    'assets/dash/' +
                        math.Random().nextInt(6).toString() +
                        '.jpg',
                    fit: BoxFit.cover,
                  ),
                  BackdropFilter(
                    child: Container(color: Colors.black12),
                    filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                  )
                ],
              ),
            ),
            width: double.infinity,
          ),
          ListView(
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
                route: TaskScreen(),
              ),
              DashboardButton(
                label: 'company',
                route: CompanyScreen(),
              ),
              DashboardButton(
                label: 'calendar',
                route: CalendarScreen(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
