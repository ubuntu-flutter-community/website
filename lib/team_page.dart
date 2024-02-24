import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:website/constants.dart';
import 'package:website/header_lead.dart';
import 'package:website/header_title.dart';
import 'package:website/message_fab.dart';
import 'package:website/scaffold_gradient.dart';
import 'package:website/top_menu_entry.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: scaffoldGradient(context),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: kToolBarHeight,
          leadingWidth: kLeadingWidth,
          leading: const HeaderLead(
            insertBackButton: true,
          ),
          title: const HeaderTitle(),
          actions: [
            TopMenuEntry(
              text: 'GitHub',
              onPressed: () => html.window.open(kGitHubOrgaLink, ''),
            ),
            TopMenuEntry(
              text: 'Home',
              onPressed: () => Navigator.of(context).pushNamed('/'),
            ),
          ],
        ),
        body: const SizedBox.shrink(),
        floatingActionButton: const MessageFab(),
      ),
    );
  }
}
