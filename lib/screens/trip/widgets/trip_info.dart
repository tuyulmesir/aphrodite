import 'package:flutter/material.dart';

class TripInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: <Widget>[
          Text("3D Singapore", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 40),
          Text(
            "3 Days Singapore is the perfect opportunity for you and your family to discover blablabla 3 Days Singapore is the perfect opportunity for you and your family to discover blablabla 3 Days Singapore is the perfect opportunity for you and your family to discover blablabla 3 Days Singapore is the perfect opportunity for you and your family to discover blablabla",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
