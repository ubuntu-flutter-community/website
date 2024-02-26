import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:universal_html/html.dart' as html;
import 'constants.dart';
import 'expandable_fab.dart';
import 'package:yaru_icons/yaru_icons.dart';

class MessageFab extends StatelessWidget {
  const MessageFab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      baseIcon: YaruIcons.send_filled,
      distance: 112,
      children: [
        ActionButton(
          onPressed: () => html.window.open(kGitHubOrgaLink, ''),
          icon: const Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              TablerIcons.brand_github,
            ),
          ),
        ),
        ActionButton(
          onPressed: () => html.window.open(kMail, ''),
          icon: const Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(TablerIcons.mail),
          ),
        ),
        ActionButton(
          onPressed: () => html.window.open(kDiscordLink, ''),
          icon: const Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(TablerIcons.brand_discord),
          ),
        ),
      ],
    );
  }
}
