import 'package:company_scheduler/logic/api/task/principal_model.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/people_search/bloc/people_added.dart';
import 'package:flutter/material.dart';

class PeopleEntry extends StatefulWidget {
  final Principal principal;
  final ScrollController scrollController;

  PeopleEntry({
    @required this.principal,
    @required this.scrollController,
  });

  @override
  State<StatefulWidget> createState() {
    return _PeopleEntryState();
  }
}

class _PeopleEntryState extends State<PeopleEntry> {
  bool _added = false;

  @override
  Widget build(BuildContext context) {
    return _added
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(2),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Text(
                  (widget.principal.name.startsWith('user')
                          ? widget.principal.name.substring(5)
                          : widget.principal.name) +
                      ' added',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        : FlatButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              widget.principal.name.startsWith('user')
                  ? widget.principal.name.substring(5)
                  : widget.principal.name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () async {
              PeopleAdded.add(widget.principal);
              setState(() => _added = true);
              widget.scrollController.animateTo(
                widget.scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear,
              );
            },
          );
  }
}
