import 'package:flutter/material.dart';

import 'palette.dart';

/// A raised button, to be used inside the card.
///
/// As button theming works differently under [Card]. this is just an easy way
/// to create, themed raised button under [Card]
class CardActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CardActionButton({
    Key key,
    this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      color: Palette.of(context).accent,
      onPressed: onPressed,
    );
  }
}
