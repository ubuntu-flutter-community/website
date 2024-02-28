import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:shimmer/shimmer.dart';
import 'package:universal_html/html.dart' as html;

import 'build_context_x.dart';
import 'constants.dart';
import 'plated_icon.dart';
import 'repositories.dart';
import 'screen_message.dart';
import 'sub_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SubPage(
      body: SizedBox(
        height: context.mq.size.height,
        child: ListView(
          padding: const EdgeInsets.all(50),
          children: [
            ScreenMessage(
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
    );
  }
}
