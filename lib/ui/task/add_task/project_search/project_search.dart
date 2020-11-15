import 'dart:async';
import 'package:company_scheduler/logic/api/task/project_model.dart';
import 'package:company_scheduler/logic/api/task/task_api.dart';
import 'package:company_scheduler/ui/other/scroll_overflow.dart';
import 'package:company_scheduler/ui/shared/custom_spinning_indicator.dart';
import 'package:company_scheduler/ui/task/add_task/data.dart';
import 'package:company_scheduler/ui/task/add_task/project_search/project_entry.dart';
import 'package:flutter/material.dart';

class ProjectSearch extends StatefulWidget {
  final PageController pageController;

  ProjectSearch({@required this.pageController});

  @override
  State<StatefulWidget> createState() {
    return _ProjectSearchState();
  }
}

class _ProjectSearchState extends State<ProjectSearch> {
  final TextEditingController _textEditingController = TextEditingController();
  final StreamController<String> _textStreamController =
      StreamController<String>.broadcast();

  Future<List> _search(String term) async => await TaskAPI.projectSearch(term);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
          child: TextField(
            controller: _textEditingController,
            autofocus: true,
            decoration: InputDecoration(
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
                  builder: (context, projects) => projects.connectionState ==
                                  ConnectionState.active &&
                              text.data.trim().length > 2 ||
                          projects.connectionState == ConnectionState.waiting &&
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
                                            projects.data[0]['status'] == 400
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
                              : ListView(
                                  children: [
                                    const SizedBox(height: 16),
                                    for (var project in projects.data)
                                      ProjectEntry(
                                        project: Project.fromJson(project),
                                        pageController: widget.pageController,
                                      ),
                                  ],
                                ),
                ),
              ),
              ScrollOverflowEffect(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _textStreamController.close();
    NewTaskData.clear();
    super.dispose();
  }
}
