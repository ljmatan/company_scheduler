import 'package:company_scheduler/logic/api/task/task_api.dart';
import 'package:company_scheduler/logic/api/task/task_types.dart';
import 'package:company_scheduler/ui/task/task_display/bloc/task_type_selection.dart';
import 'package:company_scheduler/ui/task/task_display/loading_text.dart';
import 'package:flutter/material.dart';

class TaskTypes extends StatefulWidget {
  final String taskID;

  TaskTypes({@required this.taskID});
  @override
  State<StatefulWidget> createState() {
    return _TaskTypesState();
  }
}

class _TaskTypesState extends State<TaskTypes>
    with AutomaticKeepAliveClientMixin {
  Future<List> _getTaskTypes() async => TaskAPI.getTaskTypes(widget.taskID);

  String _value;
  Text _hint;
  List _items;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: _getTaskTypes().then(
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
      builder: (context, types) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: types.hasError
            ? Text('Error: ' + types.error.toString())
            : DropdownButton(
                value: _value,
                isExpanded: true,
                items: types.data ?? <DropdownMenuItem<String>>[],
                hint: _hint ?? LoadingText(),
                onChanged: (value) {
                  TaskTypeSelection.change(value);
                  setState(() => _value = value);
                },
              ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
