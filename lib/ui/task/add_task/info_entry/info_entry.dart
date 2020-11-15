import 'package:company_scheduler/ui/task/add_task/info_entry/description_field.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/name_field.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/principals.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/priority_field.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/time_entry/time_fields.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/types_and_subjects.dart';
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 12),
                child: Text(
                  'Project name',
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
              Principals(),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: InkWell(
            customBorder: CircleBorder(),
            child: Ink(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
                boxShadow: kElevationToShadow[1],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
