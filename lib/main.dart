import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'constants.dart';
import 'contributor_service.dart';
import 'globals.dart';
import 'home_page.dart';
import 'contributors_page.dart';
import 'package:yaru/yaru.dart';

import 'projects_page.dart';

Future<void> main() async {
  registerService<ContributorService>(
    () => ContributorService(gitHub: GitHub()),
  );

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    var pTT = PageTransitionsTheme(
      builders: {
        for (final platform in TargetPlatform.values)
          platform: const _NoTransitionsBuilder(),
      },
    );
    return MaterialApp(
      title: kAppTitle,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: yaruDark.copyWith(
        pageTransitionsTheme: pTT,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/contributors': (context) => const ContributorsPage(),
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
