import 'package:flutter/material.dart';

import 'constants.dart';
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
            const Text(kLegalNote),
            const Text(kLegalLabel),
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
