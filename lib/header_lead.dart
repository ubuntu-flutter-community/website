import 'package:flutter/material.dart';
import 'constants.dart';
import 'logo.dart';

class HeaderLead extends StatelessWidget {
  const HeaderLead({
    super.key,
    this.insertBackButton = false,
  });

  final bool insertBackButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kPadding),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed('/'),
          child: const Logo(
            size: 100,
            duration: Duration.zero,
          ),
        ),
      ),
    );
  }
}
