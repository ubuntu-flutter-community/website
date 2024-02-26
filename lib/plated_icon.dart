import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PlatedIcon extends StatelessWidget {
  const PlatedIcon({
    super.key,
    required this.icon,
    this.shape,
    this.onTap,
    this.iconSize = 70.0,
  });

  final IconData icon;
  final BoxShape? shape;
  final VoidCallback? onTap;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Shimmer.fromColors(
        baseColor: kBaseColor,
        highlightColor: kHighlightColor,
        child: InkWell(
          onTap: onTap,
          borderRadius:
              BorderRadius.circular(shape == BoxShape.circle ? iconSize : 10),
          child: Container(
            padding: EdgeInsets.all(iconSize / 5.8),
            decoration: BoxDecoration(
              shape: shape ?? BoxShape.rectangle,
              borderRadius:
                  shape == BoxShape.circle ? null : BorderRadius.circular(10),
              border: const Border.fromBorderSide(
                BorderSide(width: 1, color: Colors.white),
              ),
            ),
            child: Icon(
              icon,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
