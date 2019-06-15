import 'package:flutter/material.dart';

import 'palette.dart';

/// A percent change text.
class PercentChangeText extends StatelessWidget {
  final double value;
  final TextStyle style;

  const PercentChangeText({
    Key key,
    @required this.value,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Palette.of(context).success;
    if (value < 0) color = Palette.of(context).error;
    String sign = '';
    if (value >= 0) sign = '+';
    String inPercent = (value * 100).toStringAsFixed(1);
    return Text(
      '$sign$inPercent%',
      style: style?.copyWith(color: color),
    );
  }
}
