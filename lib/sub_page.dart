import 'package:flutter/material.dart';

import 'constants.dart';
import 'foot_note.dart';
import 'header_lead.dart';
import 'header_title.dart';
import 'message_fab.dart';
import 'scaffold_gradient.dart';
import 'top_menu_entry.dart';

class SubPage extends StatelessWidget {
  const SubPage({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: scaffoldGradient(context),
      child: Scaffold(
        bottomNavigationBar: const FootNote(),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: kToolBarHeight,
          leadingWidth: kLeadingWidth,
          leading: const HeaderLead(
            insertBackButton: true,
          ),
          title: const HeaderTitle(),
          actions: createTopMenu(context),
        ),
        body: body,
        floatingActionButton: const MessageFab(),
      ),
    );
  }
}
