import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'constants.dart';
import 'contributor_service.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/constants.dart';

class ContributorGrid extends StatefulWidget {
  const ContributorGrid({super.key});

  @override
  State<ContributorGrid> createState() => _ContributorGridState();
}

class _ContributorGridState extends State<ContributorGrid> {
  late List<Contributor> _contributors;

  @override
  void initState() {
    super.initState();
    _contributors = getService<ContributorService>().contributors;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: kAvatarSize,
        mainAxisExtent: kAvatarSize,
        mainAxisSpacing: kYaruPagePadding,
        crossAxisSpacing: kYaruPagePadding,
      ),
      itemCount: _contributors.length,
      itemBuilder: (context, index) {
        final e = _contributors.elementAt(index);
        return InkWell(
          borderRadius: BorderRadius.circular(kAvatarSize * 2),
          onTap:
              e.htmlUrl == null ? null : () => launchUrl(Uri.parse(e.htmlUrl!)),
          child: Tooltip(
            message: e.login,
            child: CircleAvatar(
              backgroundImage: e.avatarUrl != null
                  ? NetworkImage(
                      e.avatarUrl!,
                    )
                  : null,
              child: e.avatarUrl == null
                  ? const YaruPlaceholderIcon(
                      size: Size.square(kAvatarSize),
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }
}
