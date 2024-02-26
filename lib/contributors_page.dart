import 'package:flutter/material.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'constants.dart';
import 'contributor_grid.dart';
import 'contributor_service.dart';
import 'foot_note.dart';
import 'header_lead.dart';
import 'header_title.dart';
import 'message_fab.dart';
import 'scaffold_gradient.dart';
import 'splash_screen.dart';
import 'top_menu_entry.dart';

class ContributorsPage extends StatefulWidget {
  const ContributorsPage({super.key});

  @override
  State<ContributorsPage> createState() => _ContributorsPageState();
}

class _ContributorsPageState extends State<ContributorsPage> {
  bool initialized = false;

  @override
  void initState() {
    super.initState();
    getService<ContributorService>().init().then(
      (value) {
        if (!initialized) {
          setState(() => initialized = value);
        }
      },
    );
  }

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
        body: initialized ? const ContributorGrid() : const SplashScreen(),
        floatingActionButton: const MessageFab(),
      ),
    );
  }
}
