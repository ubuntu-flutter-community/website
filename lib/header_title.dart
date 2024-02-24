import 'package:flutter/material.dart';
import 'build_context_x.dart';
import 'constants.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = context.mq.size.width;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed('/'),
        child: Text(
          width > 1000 ? kShortTitle : '',
          overflow: TextOverflow.fade,
          style: theme.textTheme.headlineLarge
              ?.copyWith(fontWeight: FontWeight.w100),
        ),
      ),
    );
  }
}
