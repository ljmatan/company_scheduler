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
    TaskAndTypesInput.init();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Types and subjects',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.green),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => AddDialog(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    TaskTypeSelection.dispose();
    TaskAndTypesInput.dispose();
    super.dispose();
  }
}
