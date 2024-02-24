import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:website/constants.dart';
import 'package:website/globals.dart';
import 'package:website/home_page.dart';
import 'package:website/team_page.dart';
import 'package:yaru/yaru.dart';

Future<void> main() async {
  registerService<GitHub>(GitHub.new);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kTitle,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: yaruLight,
      darkTheme: yaruDark,
      routes: {
        '/': (context) => const HomePage(),
        '/team': (context) => const TeamPage(),
      },
    );
  }
}
