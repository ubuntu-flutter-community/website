import 'package:flutter/material.dart';

import 'build_context_x.dart';

class ScreenMessage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final size = context.mq.size;
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
            if (icon != null && smallWindow)
              Padding(
                padding: EdgeInsets.only(
                  left: smallWindow ? 0 : 40,
                  bottom: smallWindow ? 8 : 0,
                ),
                child: icon,
              ),
            if (!smallWindow)
              DefaultTextStyle(
                textAlign: smallWindow ? TextAlign.center : null,
                style:
                    context.theme.textTheme.headlineSmall ?? const TextStyle(),
                child: label,
              ),
            DefaultTextStyle(
              textAlign: smallWindow ? TextAlign.center : null,
              style: context.theme.textTheme.headlineLarge ?? const TextStyle(),
              child: title,
            ),
            DefaultTextStyle(
              textAlign: smallWindow ? TextAlign.center : null,
              style: context.theme.textTheme.headlineSmall
                      ?.copyWith(overflow: TextOverflow.visible) ??
                  const TextStyle(),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: subTitle,
                ),
              ),
            ),
          ].map((e) => Flexible(child: e)).toList(),
        ),
      ),
      if (icon != null && !smallWindow)
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: icon,
        ),
    ];

    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      curve: Curves.ease,
      duration: const Duration(seconds: 2),
      builder: (BuildContext context, double opacity, Widget? child) {
        return Opacity(
          opacity: opacity,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ),
        );
      },
    );
  }
}
