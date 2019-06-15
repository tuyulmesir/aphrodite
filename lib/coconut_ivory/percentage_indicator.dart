import 'package:flutter/material.dart';

import 'palette.dart';

/// A linear percentage indicator.
class PercentageIndicator extends StatelessWidget {
  static const int _precision = 1000;

  final double height;
  final double progress;
  final Color fill;
  final Color shade;

  const PercentageIndicator({
    Key key,
    @required this.progress,
    this.height = 6,
    this.fill,
    this.shade,
  })  : assert(progress != null),
        assert(progress >= 0.0),
        assert(progress <= 1.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Color fill = this.fill ?? Palette.of(context).accent;
    Color accent = this.shade ?? Palette.of(context).accent[100];
    int ratio = (progress * _precision).floor();
    return Row(
      children: <Widget>[
        Flexible(
          child: Container(height: height, color: fill),
          flex: ratio,
        ),
        Flexible(
          child: Container(height: height, color: accent),
          flex: _precision - ratio,
        )
      ],
    );
  }
}
