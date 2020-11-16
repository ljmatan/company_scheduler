import 'package:company_scheduler/ui/task/add_task/data.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/people_search/bloc/people_added.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/people_search/add_dialog.dart';
import 'package:flutter/material.dart';

class Principals extends StatefulWidget {
  final ScrollController scrollController;

  Principals({@required this.scrollController});

  @override
  State<StatefulWidget> createState() {
    return _PrincipalsState();
  }
}

class _PrincipalsState extends State<Principals> {
  @override
  void initState() {
    super.initState();
    PeopleAdded.init();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
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
                  Text('People'),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.green),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      showDialog(
                        context: context,
                        builder: (context) => AddDialog(
                          scrollController: widget.scrollController,
                        ),
                      ).whenComplete(
                        () => NewTaskData.setPrincipals(
                          [for (var item in PeopleAdded.list) item.toJson()],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            StreamBuilder(
              stream: PeopleAdded.stream,
              initialData: PeopleAdded.list,
              builder: (context, selected) => selected.data.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                      child: Text(
                        'Tap on the + icon to add people',
                        style: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        children: [
                          for (var principal in selected.data)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(principal.name.startsWith('user')
                                    ? principal.name.substring(5)
                                    : principal.name),
                                IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    PeopleAdded.remove(principal);
                                    widget.scrollController.jumpTo(
                                      widget.scrollController.position
                                          .maxScrollExtent,
                                    );
                                  },
                                ),
                              ],
                            ),
                        ],
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
    PeopleAdded.dispose();
    super.dispose();
  }
}
