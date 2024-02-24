import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_icons/yaru_icons.dart';

class Logo extends StatefulWidget {
  const Logo({
    super.key,
    this.duration = const Duration(seconds: 15),
    this.size = 400,
  });

  final Duration duration;
  final double size;

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    if (widget.duration != Duration.zero) {
      _animationController = AnimationController(
        vsync: this,
        duration: widget.duration,
      )..repeat();
    }
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var image = Image.asset(
      'assets/logo.png',
      width: widget.size,
      fit: BoxFit.fitHeight,
      filterQuality: FilterQuality.medium,
    );
    return Stack(
      alignment: Alignment.center,
      children: [
        if (_animationController != null)
          RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_animationController!),
            child: image,
          )
        else
          image,
        if (_animationController != null)
          CircleAvatar(
            backgroundColor: YaruColors.orange,
            radius: widget.size / 10,
            child: Icon(
              YaruIcons.ubuntu_logo_simple,
              size: (widget.size / 10) * 1.5,
            ),
          ),
      ],
    );
  }
}
