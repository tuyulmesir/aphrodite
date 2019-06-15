import 'package:flutter/material.dart';

import 'discover_recommendation_card.dart';
import 'package:magic_carpet/routes.dart';

class DiscoverRecommendationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25),
      height: 600,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(Routes.trip),
            child: DiscoverRecommendationCard(image: 'images/banner-1.png'),
          ),
          SizedBox(width: 30),
          DiscoverRecommendationCard(image: 'images/banner-2.png'),
          SizedBox(width: 30),
          DiscoverRecommendationCard(image: 'images/banner-3.png'),
        ],
      ),
    );
  }
}
