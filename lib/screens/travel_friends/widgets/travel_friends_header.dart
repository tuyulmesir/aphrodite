import 'package:flutter/material.dart';

import 'package:magic_carpet/color_palette.dart';

class TravelFriendsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: Icon(
                    Icons.arrow_back_ios,
                  ),
            onTap: () => Navigator.of(context).pop(),
          ),
          SizedBox(width: 15),
          Text(
            "TravelFriends",
            style: TextStyle(
              color: ColorPalette.textGrey,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
