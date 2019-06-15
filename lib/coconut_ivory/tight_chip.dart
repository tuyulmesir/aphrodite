import 'package:flutter/material.dart';

import 'palette.dart';

/// A simpler chip implementation.
///
/// Material chip has a problem with unnecessary margins, this TightChip solves
/// that problem.
class TightChip extends StatelessWidget {
  static const double _verticalPadding = 6;
  static const double _horizontalPadding = 24;

  final String text;

  const TightChip({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle chipStyle = Theme.of(context).textTheme.body2;
    double chipHeight =
        chipStyle.fontSize * (chipStyle.height ?? 1.0) + _verticalPadding * 2.0;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(chipHeight),
        color: Palette.of(context).primary,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: _verticalPadding,
          horizontal: _horizontalPadding,
        ),
        child: Text(text, style: chipStyle),
      ),
    );
  }
}
