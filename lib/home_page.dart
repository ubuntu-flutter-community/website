import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:website/constants.dart';
import 'package:website/contributor_grid.dart';
import 'package:website/header_lead.dart';
import 'package:website/header_title.dart';
import 'package:website/message_fab.dart';
import 'package:website/scaffold_gradient.dart';
import 'package:website/top_menu_entry.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: scaffoldGradient(context),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: const MessageFab(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: kToolBarHeight,
          leadingWidth: kLeadingWidth,
          leading: const HeaderLead(),
          title: const HeaderTitle(),
          actions: [
            TopMenuEntry(
              text: 'GitHub',
              onPressed: () => html.window.open(kGitHubOrgaLink, ''),
            ),
            TopMenuEntry(
              text: 'Team',
              onPressed: () => Navigator.of(context).pushNamed('/team'),
            ),
          ],
        ),
        body: const ContributorGrid(),
      ),
    );
  }
}
