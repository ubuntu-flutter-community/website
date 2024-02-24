import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:universal_html/html.dart' as html;

import 'constants.dart';
import 'repositories.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: repositories.length,
      itemBuilder: (context, index) {
        final repo = repositories.elementAt(index);
        return ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
          leading: Icon(repo.$4),
          title: Text(repo.$2),
          subtitle: Text(repo.$3),
          trailing: Text(repo.$1),
          onTap: () =>
              html.window.open(p.join(kGitHubPrefix, repo.$1, repo.$2), ''),
        );
      },
    );
  }
}
