import 'package:flutter/material.dart';
import 'package:website/build_context_x.dart';
import 'package:website/constants.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = context.mq.size.width;

    return Text(
      width > 1000 ? kTitle : kShortTitle,
      overflow: TextOverflow.ellipsis,
      style:
          theme.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w100),
    );
  }
}
