import 'dart:async';
import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/ui/other/scroll_overflow.dart';
import 'package:company_scheduler/ui/task/add_task/add_task_button.dart';
import 'package:company_scheduler/ui/task/completed_tasks.dart';
import 'package:company_scheduler/ui/task/bloc/tab_control.dart';
import 'package:company_scheduler/ui/task/current_tasks.dart';
import 'package:company_scheduler/ui/task/tab_button.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class TaskScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TaskScreenState();
  }
}

class _TaskScreenState extends State<TaskScreen> {
  int _page = 0;

  final PageController _pageController = PageController();

  StreamSubscription _pageSubscription;

  bool _animating = false;

  @override
  void initState() {
    super.initState();
    TabControl.init();
    _pageSubscription = TabControl.stream.listen(
      (page) {
        _page = page;
        _animating = true;
        _pageController
            .animateToPage(
              page,
              duration: const Duration(milliseconds: 200),
              curve: Curves.linear,
            )
            .whenComplete(() => _animating = false);
      },
    );
    _pageController.addListener(
      () {
        if (_page != _pageController.page.round() && !_animating)
          TabControl.change(_pageController.page.round());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            Text(Internationalization.dash('task')),
          ],
        ),
      ),
      body: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: StreamBuilder(
              stream: TabControl.stream,
              initialData: 0,
              builder: (context, tab) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTabButton(
                      selected: tab.data,
                      page: 0,
                      label: 'CURRENT',
                    ),
                    CustomTabButton(
                      selected: tab.data,
                      page: 1,
                      label: 'COMPLETED',
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 141,
            child: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  children: [
                    CurrentTasks(),
                    CompletedTasks(),
                  ],
                ),
                ScrollOverflowEffect(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: AddTaskButton(),
    );
  }

  @override
  void dispose() {
    _pageSubscription.cancel();
    TabControl.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
