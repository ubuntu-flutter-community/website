import 'package:flutter/material.dart';

import 'sub_page.dart';

class LegalPage extends StatelessWidget {
  const LegalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SubPage(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Ubuntu is a registered trademark of Canonical Ltd'),
            const Text('Ubuntu Flutter Community is not Canonical Ltd'),
          ]
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
