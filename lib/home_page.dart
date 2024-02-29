import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'constants.dart';
import 'screen_message.dart';
import 'sub_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SubPage(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: ScreenMessage(
            title: Shimmer.fromColors(
              loop: 1,
              period: const Duration(seconds: 3),
              baseColor: kBaseColor,
              highlightColor: kHighlightColor,
              child: const Text(kWelcomeTitle),
            ),
            subTitle: Shimmer.fromColors(
              baseColor: kBaseColor,
              highlightColor: kHighlightColor,
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () => Navigator.of(context).pushNamed('/projects'),
                child: const Text(kWelcomeButtonText),
              ),
            ),
            label: const Text(kAppTitle),
          ),
        ),
      ),
    );
  }
}
