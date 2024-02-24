import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/constants.dart';
import 'package:website/logo.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/constants.dart';

class ContributorGrid extends StatefulWidget {
  const ContributorGrid({super.key});

  @override
  State<ContributorGrid> createState() => _ContributorGridState();
}

class _ContributorGridState extends State<ContributorGrid> {
  late Future<List<Contributor>> _contributors;

  @override
  void initState() {
    super.initState();
    _contributors = getContributors();
  }

  Future<List<Contributor>> getContributors() async {
    final allContributors = <Contributor>{};

    for (var repo in kRepos) {
      for (var e in (await _getRepoContributors(repo.$1, repo.$2))) {
        if (!allContributors.any((c) => e.id == c.id)) {
          allContributors.add(e);
        }
      }
    }

    return allContributors.toList();
  }

  Future<List<Contributor>> _getRepoContributors(
      String owner, String name) async {
    final gitHub = getService<GitHub>();

    return await (gitHub.repositories)
        .listContributors(RepositorySlug(owner, name))
        .where((c) => c.type == 'User')
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Contributor>>(
      future: _contributors,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: Logo(duration: Duration(seconds: 1)),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(50),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: kAvatarSize,
            mainAxisExtent: kAvatarSize,
            mainAxisSpacing: kYaruPagePadding,
            crossAxisSpacing: kYaruPagePadding,
          ),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final e = snapshot.data!.elementAt(index);
            return InkWell(
              borderRadius: BorderRadius.circular(kAvatarSize * 2),
              onTap: e.htmlUrl == null
                  ? null
                  : () => launchUrl(Uri.parse(e.htmlUrl!)),
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
            );
          },
        );
      },
    );
  }
}
