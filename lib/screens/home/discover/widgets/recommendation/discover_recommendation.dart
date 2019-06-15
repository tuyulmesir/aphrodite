import 'package:flutter/material.dart';
import 'package:magic_carpet/color_palette.dart';

import 'discover_recommendation_carousel.dart';

class DiscoverRecommendation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Popular plans this time around",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: ColorPalette.textGrey,
            ),
          ),
        ),
        DiscoverRecommendationCarousel(),
      ],
    );
  }
}
