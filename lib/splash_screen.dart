import 'package:flutter/material.dart';
import 'logo.dart';
import 'scaffold_gradient.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: scaffoldGradient(context),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Logo(
            size: 300,
            duration: Duration(seconds: 2),
          ),
        ),
      ),
    );
  }
}
