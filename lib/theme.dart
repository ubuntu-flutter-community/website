import 'package:flutter/material.dart';

ThemeData m3Theme({
  Brightness brightness = Brightness.light,
  Color color = Colors.red,
}) {
  return ThemeData(
    fontFamily: 'HSDSans-Regular',
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: color,
      brightness: brightness,
    ),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        for (final platform in TargetPlatform.values)
          platform: const NoTransitionsBuilder(),
      },
    ),
  );
}

class NoTransitionsBuilder extends PageTransitionsBuilder {
  const NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget? child,
  ) {
    return child!;
  }
}
