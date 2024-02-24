import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:website/constants.dart';
import 'package:website/globals.dart';
import 'package:website/home_page.dart';
import 'package:website/projects_page.dart';
import 'package:yaru/yaru.dart';

Future<void> main() async {
  registerService<GitHub>(GitHub.new);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var pTT = PageTransitionsTheme(
      builders: {
        for (final platform in TargetPlatform.values)
          platform: const _NoTransitionsBuilder(),
      },
    );
    return MaterialApp(
      title: kTitle,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: yaruLight.copyWith(
        pageTransitionsTheme: pTT,
      ),
      darkTheme: yaruDark.copyWith(
        pageTransitionsTheme: pTT,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/projects': (context) => const ProjectsPage(),
      },
    );
  }
}

class _NoTransitionsBuilder extends PageTransitionsBuilder {
  const _NoTransitionsBuilder();

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
