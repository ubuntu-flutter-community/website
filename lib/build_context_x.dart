import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

extension BuildContextX on BuildContext {
  bool get isLight => theme.brightness == Brightness.light;
  ThemeData get theme => Theme.of(this);
  MediaQueryData get mq => MediaQuery.of(this);
  Color get baseColor => theme.colorScheme.onSurface;
  Color get highlightColor => baseColor.scale(lightness: isLight ? 0.6 : -0.4);
}
