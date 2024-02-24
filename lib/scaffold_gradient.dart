import 'package:flutter/material.dart';
import 'package:website/build_context_x.dart';
import 'package:yaru/yaru.dart';

BoxDecoration scaffoldGradient(BuildContext context) {
  final theme = context.theme;
  return BoxDecoration(
      gradient: RadialGradient(colors: [
    theme.colorScheme.primary.scale(saturation: -0.8, lightness: -0.7),
    theme.scaffoldBackgroundColor.scale(lightness: -0.6),
  ]));
}
