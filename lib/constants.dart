import 'package:flutter/material.dart';
import 'package:yaru_widgets/constants.dart';

const kToolBarHeight = 140.0;
const kLeadingWidth = 85.0;
const kListTilePadding =
    EdgeInsets.only(left: kYaruPagePadding, right: kYaruPagePadding);
const kListIconPadding =
    EdgeInsets.only(bottom: 5, right: kYaruPagePadding + 2);
final kListTileShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(kYaruPagePadding / 2));

const kTitle = 'Ubuntu Flutter Community';

const kShortTitle = 'UFC';

const kGitHubOrgaLink = 'https://github.com/ubuntu-flutter-community';

const kGitHubShortLink = 'ubuntu-flutter-community/musicpod';

const kRepos = <(String, String)>{
  ('ubuntu-flutter-community', 'musicpod'),
  ('ubuntu-flutter-community', 'settings'),
  ('ubuntu-flutter-community', 'envelope'),
  ('canonical', 'ubuntu-desktop-installer'),
  ('canonical', 'ubuntu-desktop-provision'),
  ('canonical', 'desktop-security-center'),
  ('canonical', 'firmware-updater'),
  // ('canonical', 'dbus.dart'),
  // ('ubuntu', 'yaru.dart'),
  // ('ubuntu', 'yaru_widgets.dart'),
  // ('ubuntu', 'yaru_icons.dart'),
  // ('ubuntu', 'app-center.dart'),
};

const kMail = 'mailto:frederik.feichtmeier@gmail.com';

const kDiscordLink = 'https://discord.gg/vJgPV9Yn3n';

const kAvatarSize = 80.0;
