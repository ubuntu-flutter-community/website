import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;
import 'package:markdown_syntax_highlighter/markdown_syntax_highlighter.dart';
import 'package:yaru_widgets/constants.dart';
import 'package:yaru_widgets/widgets.dart';

import 'build_context_x.dart';
import 'constants.dart';
import 'sub_page.dart';

class GettingStartedPage extends StatefulWidget {
  const GettingStartedPage({super.key});

  @override
  State<GettingStartedPage> createState() => _GettingStartedPageState();
}

class _GettingStartedPageState extends State<GettingStartedPage> {
  late Future<String> _markdown;

  @override
  void initState() {
    super.initState();
    _markdown = loadMarkdown();
  }

  @override
  Widget build(BuildContext context) {
    final width = context.mq.size.width;
    return SubPage(
      body: Center(
        child: FutureBuilder(
          future: _markdown,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(kYaruPagePadding),
                  child: Text(snapshot.error.toString()),
                ),
              );
            }

            if (!snapshot.hasData) {
              return const Center(
                child: YaruCircularProgressIndicator(),
              );
            }

            return Markdown(
              padding: EdgeInsets.symmetric(
                vertical: kYaruPagePadding,
                horizontal: width < 700 ? kYaruPagePadding : width * 0.18,
              ),
              data: snapshot.data!,
              selectable: true,
              syntaxHighlighter: DartSH(),
            );
          },
        ),
      ),
    );
  }
}

class DartSH extends SyntaxHighlighter {
  @override
  TextSpan format(String source) {
    final SyntaxHighlighterStyle style =
        SyntaxHighlighterStyle.darkThemeStyle();
    return TextSpan(
      style: const TextStyle(fontFamily: 'monospace', fontSize: 10.0),
      children: <TextSpan>[
        DartSyntaxHighlighter(style).format(source),
      ],
    );
  }
}

Future<String> loadMarkdown() async {
  const address = kYaruTutorialMarkDown;
  final uri = Uri.parse(address);

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw 'Could not load';
  }
}
