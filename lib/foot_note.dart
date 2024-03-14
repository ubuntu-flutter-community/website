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
        ?.copyWith(color: context.theme.colorScheme.onSurface);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: InkWell(
            borderRadius: BorderRadius.circular(2),
            onTap: () => Navigator.of(context).pushNamed('/legal'),
            child: Text(
              'Legal note',
              style: style,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
        const Text(' · '),
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
