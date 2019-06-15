import 'package:flutter/material.dart';

import 'package:magic_carpet/color_palette.dart';

class GenieHeader extends StatelessWidget {
  final bool isIntro;
  final VoidCallback onBack;

  GenieHeader({
    @required this.isIntro,
    @required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: isIntro
                ? Transform.rotate(angle: -1.5708, child: Icon(Icons.arrow_back_ios))
                : Icon(
                    Icons.arrow_back_ios,
                  ),
            onTap: () => this.onBack(),
          ),
          SizedBox(width: 15),
          Visibility(
            visible: !isIntro,
            child: Text(
              "Explore Trips",
              style: TextStyle(
                color: ColorPalette.textGrey,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
