import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:universal_html/html.dart' as html;

import 'build_context_x.dart';
import 'constants.dart';
import 'header_lead.dart';
import 'header_title.dart';
import 'message_fab.dart';
import 'repositories.dart';
import 'scaffold_gradient.dart';
import 'top_menu_entry.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = context.mq.size.height;
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
        body: SizedBox(
          height: context.mq.size.height,
          child: ListView(
            padding: const EdgeInsets.all(50),
            children: [
              ScreenMessage(
                height: height,
                title: kWelcomeTitle,
                subTitle: kWelcomeButtonText,
                label: kTitle,
                onTap: () => Navigator.of(context).pushNamed('/projects'),
              ),
              ...repositories.map(
                (e) => ScreenMessage(
                  height: height,
                  label: e.$1,
                  title: e.$2,
                  subTitle: e.$3,
                  icon: e.$4,
                  onTap: () =>
                      html.window.open(p.join(kGitHubPrefix, e.$1, e.$2), ''),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenMessage extends StatefulWidget {
  const ScreenMessage({
    super.key,
    required this.height,
    required this.label,
    required this.title,
    required this.subTitle,
    this.icon,
    required this.onTap,
  });

  final double height;
  final String label, title, subTitle;
  final IconData? icon;
  final VoidCallback onTap;

  @override
  State<ScreenMessage> createState() => _ScreenMessageState();
}

class _ScreenMessageState extends State<ScreenMessage> {
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
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(seconds: 3),
      child: Padding(
        padding: EdgeInsets.only(
          top: (widget.height / 2) - (3 * kToolBarHeight),
          bottom: widget.height / 2,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null)
              InkWell(
                onTap: widget.onTap,
                borderRadius: BorderRadius.circular(200),
                child: Icon(widget.icon, size: 100),
              ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      widget.label,
                      style: context.theme.textTheme.headlineSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      widget.title,
                      style: context.theme.textTheme.displaySmall,
                    ),
                  ),
                  TextButton(
                    onPressed: widget.onTap,
                    child: Text(
                      widget.subTitle,
                      style: context.theme.textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
