import 'package:company_scheduler/logic/api/task/task_api.dart';
import 'package:flutter/material.dart';
import 'package:company_scheduler/ui/shared/custom_spinning_indicator.dart';
import 'package:company_scheduler/logic/api/task/principal_model.dart';

class PrincipalList extends StatefulWidget {
  final String taskID;

  PrincipalList({@required this.taskID});
  @override
  State<StatefulWidget> createState() {
    return _PrincipalListState();
  }
}

class _PrincipalListState extends State<PrincipalList>
    with AutomaticKeepAliveClientMixin {
  Future<List> _getUserList() async =>
      TaskAPI.getPrincipalListForTask(widget.taskID);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: _getUserList(),
      builder: (context, users) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    'People',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (!users.hasData && !users.hasError)
                  SizedBox(
                    height: 80,
                    child: Center(child: CustomSpinningIndicator(size: 40)),
                  )
                else if (users.hasError)
                  Text('Error: ' + users.error.toString())
                else if (users.hasData && users.data.isNotEmpty)
                  for (var user in users.data)
                    Text(
                      '- ' +
                          (Principal.fromJson(user).name.startsWith('user')
                              ? Principal.fromJson(user).name.substring(5)
                              : Principal.fromJson(user).name),
                    )
                else if (users.hasData && users.data.isEmpty)
                  Text('None'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
