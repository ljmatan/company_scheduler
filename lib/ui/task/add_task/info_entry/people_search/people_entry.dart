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
    return GestureDetector(
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.principal.name.startsWith('user')
                    ? widget.principal.name.substring(5)
                    : widget.principal.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(
                _added ? Icons.close : Icons.add,
                color: _added ? Colors.red.shade300 : null,
              ),
            ],
          ),
        ),
      ),
      onTap: () async {
        if (_added) {
          setState(() => _added = false);
          PeopleAdded.remove(widget.principal);
          widget.scrollController.jumpTo(
            widget.scrollController.position.maxScrollExtent,
          );
        } else {
          PeopleAdded.add(widget.principal);
          setState(() => _added = true);
          widget.scrollController.jumpTo(
            widget.scrollController.position.maxScrollExtent,
          );
        }
      },
    );
  }
}
