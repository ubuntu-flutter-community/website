import 'package:flutter/material.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/constants.dart';

const kPadding = 20.0;
const kToolBarHeight = 110.0;
const kLeadingWidth = 85.0;
const kListTilePadding =
    EdgeInsets.only(left: kYaruPagePadding, right: kYaruPagePadding);
const kListIconPadding =
    EdgeInsets.only(bottom: 5, right: kYaruPagePadding + 2);
final kListTileShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(kYaruPagePadding / 2),
);

const kTitle = 'Ubuntu Flutter Community';

const kUfcOrgaName = 'ubuntu-flutter-community';

const kUbuntuOrganName = 'ubuntu';

const kShortTitle = 'UFC';

const kGitHubPrefix = 'https://github.com';

const kGitHubOrgaLink = '$kGitHubPrefix/$kUfcOrgaName';

final kRepos = <(String, String, String, IconData)>{
  (
    kUfcOrgaName,
    'musicpod',
    'Local Music, Radio and Podcast Player',
    YaruIcons.music_note,
  ),
  (
    kUfcOrgaName,
    'settings',
    'Settings for the Ubuntu Desktop',
    YaruIcons.settings,
  ),
  (
    kUfcOrgaName,
    'envelope',
    'E-Mail app for the Ubuntu Desktop',
    YaruIcons.mail,
  ),
  (
    kUbuntuOrganName,
    'yaru.dart',
    'The iconic Flutter widget and theme suite for Ubuntu Desktop applications',
    YaruIcons.music_note,
  ),
  (
    kUbuntuOrganName,
    'app-center',
    'The app center of the Ubuntu Desktop',
    YaruIcons.application_bag_filled,
  ),
};

const kMail = 'mailto:frederik.feichtmeier@gmail.com';

const kDiscordLink = 'https://discord.gg/vJgPV9Yn3n';

const kAvatarSize = 60.0;
