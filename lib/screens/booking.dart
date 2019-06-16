import 'package:flutter/material.dart';

import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';

import 'travel_friends/widgets/travel_friends_body.dart';
import 'travel_friends/widgets/travel_friends_header.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MagicContainer(
        body: <Widget>[
          TravelFriendsHeader(),
          SizedBox(height: 20),
          TravelFriendsBody(),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: MagicButton(
              text: 'PROCEED',
              callback: () => Navigator.of(context).buyNow,
            ),
          )
        ],
      ),
    );
    ;
  }
}
