import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:shimmer/shimmer.dart';
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
                title: Shimmer.fromColors(
                  loop: 1,
                  period: const Duration(seconds: 3),
                  baseColor: kBaseColor,
                  highlightColor: kHighlightColor,
                  child: const Text(kWelcomeTitle),
                ),
                subTitle: Shimmer.fromColors(
                  baseColor: kBaseColor,
                  highlightColor: kHighlightColor,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () => Navigator.of(context).pushNamed('/projects'),
                    child: const Text(kWelcomeButtonText),
                  ),
                ),
                label: const Text(kAppTitle),
              ),
              ...repositories.map(
                (e) => ScreenMessage(
                  height: height,
                  label: Text(e.$1),
                  title: Text(e.$2),
                  subTitle: Text(e.$3),
                  icon: PlatedIcon(
                    onTap: () =>
                        html.window.open(p.join(kGitHubPrefix, e.$1, e.$2), ''),
                    icon: e.$4,
                    shape: e.$2 == 'settings' ? BoxShape.circle : null,
                  ),
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
  });

  final double height;
  final Widget label, title, subTitle;
  final Widget? icon;

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
          top: (widget.height / 2) - (2.3 * kToolBarHeight),
          bottom: widget.height / 2,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultTextStyle(
                    style: context.theme.textTheme.headlineSmall ??
                        const TextStyle(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3, bottom: 5),
                      child: widget.label,
                    ),
                  ),
                  DefaultTextStyle(
                    style: context.theme.textTheme.displaySmall ??
                        const TextStyle(),
                    child: widget.title,
                  ),
                  DefaultTextStyle(
                    style: context.theme.textTheme.headlineSmall
                            ?.copyWith(overflow: TextOverflow.visible) ??
                        const TextStyle(),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 3,
                        top: 8,
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: widget.subTitle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (widget.icon != null)
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: widget.icon,
              ),
          ],
        ),
      ),
    );
  }
}

class PlatedIcon extends StatelessWidget {
  const PlatedIcon({
    super.key,
    required this.icon,
    this.shape,
    this.onTap,
    this.iconSize = 70.0,
  });

  final IconData icon;
  final BoxShape? shape;
  final VoidCallback? onTap;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Shimmer.fromColors(
        baseColor: kBaseColor,
        highlightColor: kHighlightColor,
        child: InkWell(
          onTap: onTap,
          borderRadius:
              BorderRadius.circular(shape == BoxShape.circle ? iconSize : 10),
          child: Container(
            padding: EdgeInsets.all(iconSize / 5.8),
            decoration: BoxDecoration(
              shape: shape ?? BoxShape.rectangle,
              borderRadius:
                  shape == BoxShape.circle ? null : BorderRadius.circular(10),
              border: const Border.fromBorderSide(
                BorderSide(width: 1, color: Colors.white),
              ),
            ),
            child: Icon(
              icon,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
