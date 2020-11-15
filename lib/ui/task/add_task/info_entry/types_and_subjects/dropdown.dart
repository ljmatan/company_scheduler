import 'package:company_scheduler/logic/api/task/task_api.dart';
import 'package:company_scheduler/logic/api/task/task_types.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/types_and_subjects/bloc/task_and_types_input.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/types_and_subjects/bloc/task_type_selection.dart';
import 'package:company_scheduler/ui/task/task_display/loading_text.dart';
import 'package:flutter/material.dart';

class TaskTypes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TaskTypesState();
  }
}

class _TaskTypesState extends State<TaskTypes> {
  Future<List> _search() async => TaskAPI.getTaskTypes();

  String _value;
  Text _hint;
  List _items;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _search().then(
        (types) {
          _hint = Text('Types');
          _items = <DropdownMenuItem<String>>[
            for (var type in types)
              DropdownMenuItem(
                value: TaskType.fromJson(type).id.toString(),
                child: Text(TaskType.fromJson(type).name),
              ),
          ];
          return _items;
        },
      ),
      builder: (context, types) => types.hasError
          ? Text('Error: ' + types.error.toString())
          : DropdownButton(
              value: _value,
              isExpanded: true,
              items: types.data ?? <DropdownMenuItem<String>>[],
              hint: _hint ?? LoadingText(),
              onChanged: (value) {
                TaskTypeSelection.change(value);
                TaskTypeSelection.setTypeString(
                    types.data.singleWhere((e) => e.value == value).child.data);
                setState(() => _value = value);
              },
            ),
    );
  }
}
