import 'build_context_x.dart';
import 'constants.dart';
import 'package:flutter/material.dart';

class FootNote extends StatelessWidget {
  const FootNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$kAppTitle · 2024',
          style: context.theme.textTheme.labelSmall
              ?.copyWith(color: Colors.white.withOpacity(0.7)),
        ),
      ],
    );
  }
}
