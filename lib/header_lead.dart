import 'package:flutter/material.dart';
import 'package:website/constants.dart';
import 'package:website/logo.dart';

class HeaderLead extends StatelessWidget {
  const HeaderLead({
    super.key,
    this.insertBackButton = false,
  });

  final bool insertBackButton;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: kPadding),
      child: Logo(
        size: 100,
        duration: Duration.zero,
      ),
    );
  }
}
