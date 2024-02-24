import 'package:flutter/material.dart';
import 'package:website/constants.dart';
import 'package:website/header_lead.dart';
import 'package:website/header_title.dart';
import 'package:website/logo.dart';
import 'package:website/scaffold_gradient.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: scaffoldGradient(context),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: kToolBarHeight,
          leadingWidth: kLeadingWidth,
          leading: const HeaderLead(),
          title: const HeaderTitle(),
        ),
        body: const Center(
          child: Logo(
            duration: Duration(seconds: 2),
          ),
        ),
      ),
    );
  }
}
