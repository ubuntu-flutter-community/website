import 'package:flutter/material.dart';
import 'package:website/logo.dart';
import 'package:yaru_widgets/constants.dart';

class HeaderLead extends StatelessWidget {
  const HeaderLead({
    super.key,
    this.insertBackButton = false,
  });

  final bool insertBackButton;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: kYaruPagePadding),
      child: Logo(
        size: 100,
        duration: Duration.zero,
      ),
    );
  }
}
