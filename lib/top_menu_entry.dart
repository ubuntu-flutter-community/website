import 'package:flutter/material.dart';
import 'package:website/build_context_x.dart';

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
    return Padding(
      padding: EdgeInsets.only(right: padding),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: context.theme.textTheme.headlineSmall,
        ),
      ),
    );
  }
}
