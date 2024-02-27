import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:universal_html/html.dart' as html;

import 'build_context_x.dart';
import 'constants.dart';

class FootNote extends StatelessWidget {
  const FootNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final style = context.theme.textTheme.labelSmall
        ?.copyWith(color: Colors.white.withOpacity(0.7));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            '$kAppTitle · 2024 · ',
            style: style,
            overflow: TextOverflow.fade,
          ),
        ),
        Flexible(
          child: InkWell(
            borderRadius: BorderRadius.circular(2),
            onTap: () => html.window
                .open(p.join(kGitHubPrefix, kUfcOrgaName, 'website'), ''),
            child: Text(
              'Website Sourcecode',
              style: style,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ],
    );
  }
}
