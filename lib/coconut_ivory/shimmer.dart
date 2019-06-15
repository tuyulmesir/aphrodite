import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart' as shimmer;

import 'palette.dart';

Gradient _defaultGradient(BuildContext context) {
  Color color = Palette.of(context).primary;
  Color base = color.withOpacity(0.75);
  Color highlight = color.withOpacity(0.95);
  return LinearGradient(
    colors: <Color>[base, highlight, highlight, base],
    stops: <double>[0.35, 0.48, 0.52, 0.65],
  );
}

/// A shimmer painter widget.
///
/// Shimmer all of non-transparent child.
class Shimmer extends StatelessWidget {
  final Widget child;

  const Shimmer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return shimmer.Shimmer(
      gradient: _defaultGradient(context),
      child: child,
    );
  }
}

/// A shimmering box.
class ShimmerBox extends StatelessWidget {
  final double width;
  final double height;

  ShimmerBox({this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.black,
        ),
      ),
    );
  }
}
