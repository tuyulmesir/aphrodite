import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';

import 'package:magic_carpet/color_palette.dart';

class PlansHeader extends StatelessWidget {
  final bool showButton;

  PlansHeader({
    this.showButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "My Plans",
                  style: TextStyle(
                    color: ColorPalette.textGrey,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Visibility(
                visible: showButton,
                child: FlatButton(
                  child: Text("Find More Plans"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () => print('boop'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
