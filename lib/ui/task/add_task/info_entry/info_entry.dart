import 'package:company_scheduler/ui/task/add_task/data.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/description_field.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/name_field.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/principals.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/priority_field.dart';
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        controller: _scrollController,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 12),
            child: Text(
              NewTaskData.projectName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            'Fill out the following info',
            style: const TextStyle(color: Colors.black54),
          ),
          NameField(controller: _nameController),
          DescriptionField(controller: _descriptionController),
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
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
