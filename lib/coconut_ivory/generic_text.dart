import 'package:flutter/material.dart';

class GenericText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final double lineHeight;
  final double letterSpacing;
  final Color color;
  final Alignment alignment;

  double get heightFactor => (lineHeight ?? 12.0) / (fontSize ?? 12.0);

  GenericText(this.text,
      {this.fontSize,
      this.fontWeight,
      this.lineHeight,
      this.letterSpacing,
      this.color,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.centerLeft,
      heightFactor: heightFactor,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? 14.0,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing ?? 0.5,
          color: color ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
