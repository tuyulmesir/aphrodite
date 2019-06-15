import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:landx_app/widgets/generic_text/generic_text.dart';

/// A card with zero elevation.
///
/// Behaves the same way as [Card] with [ClipRRect] applied on the [child] and
/// zero elevation.
class FlatCard extends StatelessWidget {
  static const EdgeInsetsGeometry defaultPadding = EdgeInsets.all(15);
  static const EdgeInsetsGeometry defaultMargin = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 4.0,
  );

  final String title;
  final Color color;
  final ShapeBorder shape;
  final bool borderOnForeground;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Clip clipBehavior;
  final Widget child;
  final bool semanticContainer;

  const FlatCard({
    Key key,
    this.title = '',
    this.color,
    this.shape,
    this.borderOnForeground = true,
    this.margin = defaultMargin,
    this.padding = defaultPadding,
    this.clipBehavior,
    this.semanticContainer = true,
    this.child,
  }) : super(key: key);

  FlatCard.raw({
    Key key,
    this.title = '',
    this.color,
    this.shape,
    this.borderOnForeground = true,
    this.clipBehavior,
    this.semanticContainer = true,
    this.child,
  })  : this.margin = EdgeInsets.all(0),
        this.padding = EdgeInsets.all(0);

  @override
  Widget build(BuildContext context) {
    var cardChildren = <Widget>[];

    if (title.isNotEmpty) {
      cardChildren.add(
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              child: GenericText(
                title,
                color: Color(0x61000000),
                fontSize: Platform.isAndroid ? 12.0 : 11.0,
                lineHeight: Platform.isAndroid ? 16.0 : 13.0,
                letterSpacing: Platform.isAndroid ? 0.4 : 0.07,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Divider(
                height: 1.0,
                color: Platform.isAndroid
                    ? Color(0xde000000)
                    : Color.fromARGB(255, 234, 239, 244),
              ),
            ),
          ],
        ),
      );
    }

    cardChildren.add(Padding(
      padding: padding,
      child: child,
    ));

    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: Card(
        key: key,
        color: color,
        shape: shape,
        borderOnForeground: borderOnForeground,
        elevation: 0.0,
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: cardChildren,
        ),
        clipBehavior: clipBehavior,
        semanticContainer: semanticContainer,
      ),
    );
  }
}
