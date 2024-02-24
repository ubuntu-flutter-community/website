import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:website/build_context_x.dart';
import 'package:website/constants.dart';
import 'package:website/contributor_grid.dart';
import 'package:website/header_lead.dart';
import 'package:website/header_title.dart';
import 'package:website/message_fab.dart';
import 'package:website/top_menu_entry.dart';
import 'package:yaru/yaru.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
        theme.colorScheme.primary.scale(saturation: -0.8, lightness: -0.6),
        theme.scaffoldBackgroundColor.scale(lightness: -0.6),
      ])),
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
