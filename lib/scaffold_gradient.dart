import 'package:flutter/material.dart';
import 'package:website/build_context_x.dart';
import 'package:yaru/yaru.dart';

BoxDecoration scaffoldGradient(BuildContext context) {
  final theme = context.theme;
  return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
        theme.scaffoldBackgroundColor.scale(lightness: -0.6),
        theme.colorScheme.primary.scale(saturation: -0.8, lightness: -0.7),
      ]));
}
