import 'package:flutter/material.dart';

import 'build_context_x.dart';
import 'constants.dart';
import 'header_lead.dart';
import 'header_title.dart';
import 'message_fab.dart';
import 'scaffold_gradient.dart';
import 'top_menu_entry.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() => _opacity = 1);
    });
  }

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
          actions: createTopMenu(context),
        ),
        body: Center(
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 3),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
                bottom: 100,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      kTitle,
                      style: context.theme.textTheme.headlineSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Changing the Ubuntu Desktop to a fluttery future',
                      style: context.theme.textTheme.displaySmall,
                    ),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/projects'),
                    child: Text(
                      'See our projects',
                      style: context.theme.textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
