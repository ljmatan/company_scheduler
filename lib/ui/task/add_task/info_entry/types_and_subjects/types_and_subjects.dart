import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/types_and_subjects/add_dialog.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/types_and_subjects/bloc/task_and_types_input.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/types_and_subjects/bloc/task_type_selection.dart';
import 'package:flutter/material.dart';

class TypesAndSubjects extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TypesAndSubjectsState();
  }
}

class _TypesAndSubjectsState extends State<TypesAndSubjects> {
  @override
  void initState() {
    super.initState();
    TaskTypeSelection.init();
    TypeAndSubject.init();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(Internationalization.task('type and subject')),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.green),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      showDialog(
                        context: context,
                        builder: (context) => AddDialog(),
                      );
                    },
                  ),
                ],
              ),
            ),
            StreamBuilder(
              stream: TypeAndSubject.stream,
              builder: (context, info) => Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: info.hasData
                    ? Text(info.data.split('+').join(' - '))
                    : Text(
                        Internationalization.task(
                            'tap on the + icon to select task and type'),
                        style: const TextStyle(color: Colors.black54),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    TaskTypeSelection.dispose();
    TypeAndSubject.dispose();
    super.dispose();
  }
}
