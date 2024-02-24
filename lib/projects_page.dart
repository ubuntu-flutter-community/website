import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:website/constants.dart';
import 'package:website/header_lead.dart';
import 'package:website/header_title.dart';
import 'package:website/message_fab.dart';
import 'package:website/scaffold_gradient.dart';
import 'package:website/top_menu_entry.dart';
import 'package:yaru_widgets/constants.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: scaffoldGradient(context),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: kToolBarHeight,
          leadingWidth: kLeadingWidth,
          leading: const HeaderLead(
            insertBackButton: true,
          ),
          title: const HeaderTitle(),
          actions: [
            TopMenuEntry(
              text: 'Home',
              onPressed: () => Navigator.of(context).pushNamed('/'),
            ),
            const SizedBox(
              width: kYaruPagePadding,
            ),
            TopMenuEntry(
              text: 'GitHub',
              onPressed: () => html.window.open(kGitHubOrgaLink, ''),
            ),
            const SizedBox(
              width: kPadding,
            )
          ],
        ),
        body: const SizedBox.shrink(),
        floatingActionButton: const MessageFab(),
      ),
    );
  }
}
