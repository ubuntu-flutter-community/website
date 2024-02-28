import 'package:flutter/material.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'contributor_grid.dart';
import 'contributor_service.dart';
import 'splash_screen.dart';
import 'sub_page.dart';

class ContributorsPage extends StatefulWidget {
  const ContributorsPage({super.key});

  @override
  State<ContributorsPage> createState() => _ContributorsPageState();
}

class _ContributorsPageState extends State<ContributorsPage> {
  bool initialized = false;

  @override
  void initState() {
    super.initState();
    getService<ContributorService>().init().then(
      (value) {
        if (!initialized) {
          setState(() => initialized = value);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SubPage(
      body: initialized ? const ContributorGrid() : const SplashScreen(),
    );
  }
}
