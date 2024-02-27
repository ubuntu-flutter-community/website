import 'package:flutter/material.dart';

import 'build_context_x.dart';
import 'constants.dart';

class TopMenuEntry extends StatelessWidget {
  const TopMenuEntry({
    super.key,
    this.onPressed,
    this.padding = 20.0,
    required this.text,
  });

  final void Function()? onPressed;
  final String text;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: context.theme.textTheme.bodyLarge,
      ),
    );
  }
}

List<Widget> createTopMenu(BuildContext context) => [
      TopMenuEntry(
        text: 'Projects',
        onPressed: () => Navigator.of(context).pushNamed('/projects'),
      ),
      TopMenuEntry(
        text: 'Contributors',
        onPressed: () => Navigator.of(context).pushNamed('/contributors'),
      ),
      const SizedBox(
        width: kPadding,
      ),
    ];
