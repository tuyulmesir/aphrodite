import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';
import 'package:magic_carpet/routes.dart';

class TripInfo extends StatelessWidget {
  final String title;
  final String description;
  final int nettPrice;
  final int arrival;
  final int departure;

  const TripInfo({
    Key key,
    this.title,
    this.description,
    this.nettPrice,
    this.arrival,
    this.departure,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int total = nettPrice + arrival + departure;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: <Widget>[
          Text(title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 40),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 40),
          Text('Rp ${total}', style: TextStyle(fontSize: 24)),
          SizedBox(height: 16),
          MagicButton(
            text: 'BUY NOW',
            callback: () => Navigator.of(context).pushNamed(Routes.booking),
          ),
        ],
      ),
    );
  }
}
