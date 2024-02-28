import 'package:flutter/material.dart';

import 'projects_list.dart';
import 'sub_page.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SubPage(
      body: ProjectsList(),
    );
  }
}
