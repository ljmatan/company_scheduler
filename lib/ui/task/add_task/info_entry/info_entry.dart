import 'package:company_scheduler/ui/task/add_task/info_entry/description_field.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/name_field.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/principals.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/priority_field.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/project_search.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/submit_button.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/time_entry/time_fields.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/types_and_subjects/types_and_subjects.dart';
import 'package:flutter/material.dart';

class InfoEntry extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InfoEntryState();
  }
}

class _InfoEntryState extends State<InfoEntry> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _projectSearchController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        controller: _scrollController,
        children: [
          NameField(controller: _nameController),
          DescriptionField(controller: _descriptionController),
          ProjectSearchButton(textEditingController: _projectSearchController),
          PriorityField(),
          TypesAndSubjects(),
          TimeFields(),
          Principals(scrollController: _scrollController),
          SubmitButton(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _projectSearchController.dispose();
    _scrollController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
