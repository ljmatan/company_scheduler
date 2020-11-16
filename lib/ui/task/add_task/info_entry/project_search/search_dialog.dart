import 'dart:async';
import 'package:company_scheduler/logic/api/task/task_api.dart';
import 'package:company_scheduler/logic/api/task/project_model.dart';
import 'package:company_scheduler/ui/shared/custom_spinning_indicator.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/project_search/project_entry.dart';
import 'package:flutter/material.dart';

class SearchDialog extends StatefulWidget {
  final TextEditingController textEditingController;

  SearchDialog({@required this.textEditingController});

  @override
  State<StatefulWidget> createState() {
    return _SearchDialogState();
  }
}

class _SearchDialogState extends State<SearchDialog> {
  final TextEditingController _textEditingController = TextEditingController();
  final StreamController<String> _textStreamController =
      StreamController<String>.broadcast();

  Future<List> _search(String term) async => await TaskAPI.projectSearch(term);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 50),
      padding: MediaQuery.of(context).viewInsets,
      child: Material(
        color: Colors.grey[50],
        elevation: 2,
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                  child: TextField(
                    controller: _textEditingController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Project',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.search),
                    ),
                    onChanged: (text) => _textStreamController.add(text),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      StreamBuilder(
                        stream: _textStreamController.stream,
                        initialData: '',
                        builder: (context, text) => FutureBuilder(
                          future: text.data.trim().length < 3
                              ? Future.value([])
                              : _search(text.data.trim()),
                          builder: (context, projects) => projects
                                              .connectionState ==
                                          ConnectionState.active &&
                                      text.data.trim().length > 2 ||
                                  projects.connectionState ==
                                          ConnectionState.waiting &&
                                      text.data.trim().length > 2
                              ? Center(child: CustomSpinningIndicator())
                              : projects.hasError ||
                                      projects.hasData &&
                                          projects.data.isNotEmpty &&
                                          projects.data[0]['status'] == 400
                                  ? Center(
                                      child: Text(
                                        'Error: ' +
                                            (projects.hasData &&
                                                    projects.data.isNotEmpty &&
                                                    projects.data[0]
                                                            ['status'] ==
                                                        400
                                                ? projects.data[0]['message']
                                                : projects.error.toString()),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  : !projects.hasData || projects.data.isEmpty
                                      ? Center(
                                          child: Text(
                                            text.data == ''
                                                ? 'Search for a project'
                                                : text.data.trim().length < 3
                                                    ? 'Enter at least 3 characters'
                                                    : 'No projects found',
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                            16,
                                            12,
                                            16,
                                            12,
                                          ),
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              border: Border.all(width: 0.1),
                                              color: Colors.grey[50],
                                            ),
                                            child: ListView(
                                              children: [
                                                for (var project
                                                    in projects.data)
                                                  ProjectEntry(
                                                    project: Project.fromJson(
                                                        project),
                                                    textController: widget
                                                        .textEditingController,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: GestureDetector(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: kElevationToShadow[1],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                onTap: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _textStreamController.close();
    super.dispose();
  }
}
