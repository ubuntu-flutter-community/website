import 'package:flutter/material.dart';

import 'constants.dart';
import 'foot_note.dart';
import 'header_lead.dart';
import 'header_title.dart';
import 'message_fab.dart';
import 'projects_list.dart';
import 'scaffold_gradient.dart';
import 'top_menu_entry.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: scaffoldGradient(context),
      child: Scaffold(
        bottomNavigationBar: const FootNote(),
        backgroundColor: Colors.transparent,
        floatingActionButton: const MessageFab(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: kToolBarHeight,
          leadingWidth: kLeadingWidth,
          leading: const HeaderLead(),
          title: const HeaderTitle(),
          actions: createTopMenu(context),
        ),
        body: const ProjectsList(),
      ),
    );
  }
}
