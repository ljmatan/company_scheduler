import 'package:company_scheduler/logic/api/task/principal_model.dart';
import 'package:company_scheduler/logic/api/task/task_api.dart';
import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/ui/shared/custom_spinning_indicator.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/people_search/bloc/people_added.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/people_search/people_entry.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class AddDialog extends StatelessWidget {
  final ScrollController scrollController;

  AddDialog({@required this.scrollController});

  Future<List> _search() async => await TaskAPI.getPrincipalList();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Material(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          elevation: 2,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.66,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: Column(
                children: [
                  Expanded(
                    child: FutureBuilder(
                      future: _search(),
                      builder: (context, people) {
                        if (people.connectionState != ConnectionState.done)
                          return Center(child: CustomSpinningIndicator());
                        else if (people.hasError ||
                            people.hasData &&
                                people.data.isNotEmpty &&
                                people.data[0]['status'] == 400)
                          return Center(
                            child: Text(
                              Internationalization.misc('error') +
                                  ': ' +
                                  (people.hasData &&
                                          people.data.isNotEmpty &&
                                          people.data[0]['status'] == 400
                                      ? people.data[0]['message']
                                      : people.error.toString()),
                              textAlign: TextAlign.center,
                            ),
                          );
                        else if (!people.hasData || people.data.isEmpty)
                          return Center(
                            child: Text(
                              Internationalization.task('none'),
                              textAlign: TextAlign.center,
                            ),
                          );
                        else {
                          List<PeopleEntry> _list = [
                            for (var principal in people.data)
                              if (!PeopleAdded.list.contains(principal))
                                PeopleEntry(
                                  principal: Principal.fromJson(
                                    principal,
                                  ),
                                  scrollController: scrollController,
                                )
                          ];
                          PeopleAdded.list.forEach(
                            (added) => _list.removeWhere(
                                (all) => all.principal.id == added.id),
                          );
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              color: Colors.grey[50],
                            ),
                            child: ListView(
                              children: [
                                for (var entry in _list) entry,
                              ],
                            ),
                          );
                        }
                      },
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
