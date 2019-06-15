import 'package:flutter/material.dart';

class DiscoverRecommendationCard extends StatelessWidget {
  final String image;

  DiscoverRecommendationCard({
    @required this.image,
  });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[100],
            image: DecorationImage(
              image: AssetImage(this.image),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x90000000),
                blurRadius: 15,
                spreadRadius: -5,
                offset: Offset(
                  0,
                  10,
                ),
              ),
            ],
          ),
          child: Container(
            width: 300,
            height: 500,
          ),
        ),
      ],
    );
  }
}
