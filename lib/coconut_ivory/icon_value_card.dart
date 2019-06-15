import 'package:flutter/material.dart';

import 'flat_card.dart';

class IconValueCard extends StatelessWidget {
  final Image image;
  final Widget bottom;
  final String caption;
  final String value;

  const IconValueCard({
    Key key,
    @required this.image,
    @required this.caption,
    @required this.value,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle captionStyle = textTheme.caption;
    TextStyle valueStyle = textTheme.body1.copyWith(fontSize: 20);

    return FlatCard(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              image,
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 4),
                  Text(caption, style: captionStyle),
                  SizedBox(height: 4),
                  Text(value, style: valueStyle),
                  SizedBox(height: 4),
                ],
              ),
            ],
          ),
          bottom ?? Container(),
        ],
      ),
    );
  }
}
