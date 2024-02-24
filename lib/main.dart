import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:website/constants.dart';
import 'package:website/contributor_service.dart';
import 'package:website/globals.dart';
import 'package:website/home_page.dart';
import 'package:website/projects_page.dart';
import 'package:website/splash_screen.dart';
import 'package:yaru/yaru.dart';

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
  bool initialized = false;

  @override
  void initState() {
    super.initState();
    getService<ContributorService>().init().then(
      (value) {
        if (!initialized) {
          setState(() => initialized = value);
        }
      },
    );
  }

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
      themeMode: ThemeMode.dark,
      darkTheme: yaruDark.copyWith(
        pageTransitionsTheme: pTT,
      ),
      routes: {
        '/': (context) => initialized ? const HomePage() : const SplashScreen(),
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
