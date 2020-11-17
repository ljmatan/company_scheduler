import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/project_search/search_dialog.dart';
import 'package:flutter/material.dart';

class ProjectSearchButton extends StatelessWidget {
  final TextEditingController textEditingController;

  ProjectSearchButton({@required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: GestureDetector(
        child: TextField(
          enabled: false,
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: Internationalization.task('project'),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: Icon(Icons.search),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.1,
              ),
            ),
          ),
        ),
        onTap: () {
          FocusManager.instance.primaryFocus.unfocus();
          showDialog(
            context: context,
            builder: (context) => SearchDialog(
              textEditingController: textEditingController,
            ),
          );
        },
      ),
    );
  }
}
