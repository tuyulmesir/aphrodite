import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/palette.dart';

class PullToRetryPrompt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(40),
      children: <Widget>[
        Text(
          'Ups, terjadi kesalahan,\ntarik kebawah untuk memuat ulang.',
          style: Theme.of(context).textTheme.subtitle,
          textAlign: TextAlign.center,
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: Palette.of(context).primary,
          size: 48,
        ),
      ],
    );
  }
}
