import 'package:flutter/material.dart';

import 'build_context_x.dart';
import 'constants.dart';

class ScreenMessage extends StatefulWidget {
  const ScreenMessage({
    super.key,
    required this.label,
    required this.title,
    required this.subTitle,
    this.icon,
  });

  final Widget label, title, subTitle;
  final Widget? icon;

  @override
  State<ScreenMessage> createState() => _ScreenMessageState();
}

class _ScreenMessageState extends State<ScreenMessage> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() => _opacity = 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = context.mq.size;
    final height = size.height;
    final width = size.width;

    final smallWindow = width < 600;

    final children = [
      Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: smallWindow
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon != null && smallWindow)
              Padding(
                padding: EdgeInsets.only(
                  left: smallWindow ? 0 : 40,
                  bottom: smallWindow ? 8 : 0,
                ),
                child: widget.icon,
              ),
            if (!smallWindow)
              DefaultTextStyle(
                textAlign: smallWindow ? TextAlign.center : null,
                style:
                    context.theme.textTheme.headlineSmall ?? const TextStyle(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 3, bottom: 5),
                  child: widget.label,
                ),
              ),
            DefaultTextStyle(
              textAlign: smallWindow ? TextAlign.center : null,
              style: context.theme.textTheme.headlineLarge ?? const TextStyle(),
              child: widget.title,
            ),
            DefaultTextStyle(
              textAlign: smallWindow ? TextAlign.center : null,
              style: context.theme.textTheme.headlineSmall
                      ?.copyWith(overflow: TextOverflow.visible) ??
                  const TextStyle(),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 3,
                  top: 8,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: widget.subTitle,
                ),
              ),
            ),
          ].map((e) => Flexible(child: e)).toList(),
        ),
      ),
      if (widget.icon != null && !smallWindow)
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: widget.icon,
        ),
    ];

    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(seconds: 3),
      child: Padding(
        padding: EdgeInsets.only(
          top: (height / 2) - (2.3 * kToolBarHeight),
          bottom: height / 2,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
