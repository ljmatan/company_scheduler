import 'package:flutter/material.dart';
import 'package:company_scheduler/logic/api/task/project_model.dart';

class ProjectEntry extends StatelessWidget {
  final Project project;
  final PageController pageController;

  ProjectEntry({
    @required this.project,
    @required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        child: Ink(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.1,
                color: Colors.black54,
              ),
            ),
          ),
          child: SizedBox(
            height: 72,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        project.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(project.projectType.name),
                      Text(project.projectType.account['name']),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        project.client.name,
                        style: const TextStyle(color: Colors.black54),
                      ),
                      Text(
                        project.client.account.name,
                        style: const TextStyle(color: Colors.black54),
                      ),
                      Text(
                        project.client.clientType.name,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap: () {
          FocusScope.of(context).unfocus();
          pageController.animateToPage(
            1,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        },
      ),
    );
  }
}
