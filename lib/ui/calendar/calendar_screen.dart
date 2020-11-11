import 'package:company_scheduler/logic/calendar/calendar_provider.dart';
import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/ui/calendar/appbar/appbar.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          kToolbarHeight + 24,
        ),
        child: CalendarAppBar(),
      ),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: Drawer(),
      body: ListView(
        children: [
          for (var row in CalendarProvider.weekRows(DateTime.now(), [])) row,
        ],
      ),
    );
  }
}
