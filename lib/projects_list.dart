import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:universal_html/html.dart' as html;
import 'package:yaru_widgets/constants.dart';
import 'package:yaru_widgets/widgets.dart';

import 'build_context_x.dart';
import 'constants.dart';
import 'repositories.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({super.key});

  @override
  Widget build(BuildContext context) {
    final smallWindow = context.mq.size.width < 700;
    return Center(
      child: SingleChildScrollView(
        padding: smallWindow ? EdgeInsets.zero : const EdgeInsets.all(50),
        child: Center(
          child: SizedBox(
            width: 600,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kYaruContainerRadius),
              child: YaruBorderContainer(
                border: Border.all(
                  color: smallWindow
                      ? Colors.transparent
                      : context.theme.dividerColor,
                ),
                padding: EdgeInsets.zero,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(repositories.length, (index) {
                    final repo = repositories.elementAt(index);
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      leading: Icon(repo.$4),
                      title: Text(repo.$2),
                      subtitle: Text(repo.$3),
                      trailing: SizedBox(
                        width: 80,
                        child: Text(
                          repo.$1,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      onTap: () => html.window
                          .open(p.join(kGitHubPrefix, repo.$1, repo.$2), ''),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
