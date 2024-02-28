import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;
import 'package:yaru_widgets/constants.dart';
import 'package:yaru_widgets/widgets.dart';

import 'build_context_x.dart';
import 'constants.dart';
import 'foot_note.dart';
import 'header_lead.dart';
import 'header_title.dart';
import 'message_fab.dart';
import 'scaffold_gradient.dart';
import 'top_menu_entry.dart';

class GettingStartedPage extends StatelessWidget {
  const GettingStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.mq.size.width;
    return Container(
      decoration: scaffoldGradient(context),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const HeaderTitle(),
          backgroundColor: Colors.transparent,
          toolbarHeight: kToolBarHeight,
          leadingWidth: kLeadingWidth,
          leading: const HeaderLead(),
          actions: createTopMenu(context),
        ),
        body: Center(
          child: FutureBuilder(
            future: loadMarkdown(),
            builder: (context, shot) {
              if (!shot.hasData) {
                return const Center(
                  child: YaruCircularProgressIndicator(),
                );
              }

              return Markdown(
                padding: EdgeInsets.symmetric(
                  vertical: kYaruPagePadding,
                  horizontal: width < 700 ? kYaruPagePadding : width * 0.2,
                ),
                data: shot.data!,
              );
            },
          ),
        ),
        bottomNavigationBar: const FootNote(),
        floatingActionButton: const MessageFab(),
      ),
    );
  }
}

Future<String> loadMarkdown() async {
  const address =
      'https://raw.githubusercontent.com/ubuntu-flutter-community/yaru_tutorial/master/README.md';
  final uri = Uri.parse(address);

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw 'Could not load';
  }
}
