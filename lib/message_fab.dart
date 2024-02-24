import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:universal_html/html.dart' as html;
import 'package:website/constants.dart';
import 'package:website/expandable_fab.dart';
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
          icon: const Icon(
            TablerIcons.brand_github,
          ),
        ),
        ActionButton(
          onPressed: () => html.window.open(kMail, ''),
          icon: const Icon(TablerIcons.mail),
        ),
        ActionButton(
          onPressed: () => html.window.open(kDiscordLink, ''),
          icon: const Icon(TablerIcons.brand_discord),
        ),
      ],
    );
  }
}
