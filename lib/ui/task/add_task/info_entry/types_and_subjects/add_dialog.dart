import 'package:company_scheduler/logic/api/task/task_api.dart';
import 'package:company_scheduler/logic/api/task/task_subject_model.dart';
import 'package:company_scheduler/ui/other/scroll_overflow.dart';
import 'package:company_scheduler/ui/shared/custom_spinning_indicator.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/types_and_subjects/bloc/task_type_selection.dart';

import 'package:company_scheduler/ui/task/add_task/info_entry/types_and_subjects/dropdown.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/types_and_subjects/subject_entry.dart';
import 'package:flutter/material.dart';

class AddDialog extends StatelessWidget {
  Future<List> _search(type) async => TaskAPI.getTaskSubjectForTaskType(type);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Material(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(4),
          elevation: 2,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.66,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: Column(
                children: [
                  TaskTypes(),
                  Expanded(
                    child: Stack(
                      children: [
                        StreamBuilder(
                          stream: TaskTypeSelection.stream,
                          builder: (context, type) => FutureBuilder(
                            future: type.hasData
                                ? _search(type.data)
                                : Future.value([]),
                            builder: (context, task) {
                              if (task.connectionState != ConnectionState.done)
                                return Center(child: CustomSpinningIndicator());
                              else if (task.hasError ||
                                  task.hasData &&
                                      task.data.isNotEmpty &&
                                      task.data[0]['status'] == 400)
                                return Center(
                                  child: Text(
                                    'Error: ' +
                                        (task.hasData &&
                                                task.data.isNotEmpty &&
                                                task.data[0]['status'] == 400
                                            ? task.data[0]['message']
                                            : task.error.toString()),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              else if (!task.hasData || task.data.isEmpty)
                                return Center(
                                  child: Text(
                                    'Select a task type from the dropdown menu',
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              else {
                                return ListView(
                                  children: [
                                    const SizedBox(height: 16),
                                    for (var entry in task.data)
                                      SubjectEntry(
                                        subject: TaskSubject.fromJson(entry),
                                      ),
                                    const SizedBox(height: 16),
                                  ],
                                );
                              }
                            },
                          ),
                        ),
                        ScrollOverflowEffect(),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: ScrollOverflowEffect(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        color: Theme.of(context).primaryColor,
                        child: const Text(
                          'OK',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
