import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';
import 'package:magic_carpet/routes.dart';
import 'package:magic_carpet/screens/home/plans/widgets/plans_entry/plans_entry_card.dart';
import 'package:magic_carpet/services/heracles.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 50),
            child: Image.asset(
              'images/checkmark.png',
              width: 250,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Splendid, Shimmering, Hooray!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Your transaction has been completed, please go to your itinerary tab to view it',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          Text(
            "",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 60),
          MagicButton(
            text: 'Take Me there',
            callback: () =>
                Heracles.of(context).purchaseTrip('a84YMB83hXGt1fVKNwjd').then(
                      (v) => Navigator.of(context)
                          .popUntil(ModalRoute.withName(Routes.home)),
                    ),
          )
        ],
      ),
    );
  }
}
