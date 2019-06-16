import 'package:flutter/material.dart';

import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';

import 'widgets/index.dart';

class TravelFriendsScreen extends StatefulWidget {
  @override
  _TravelFriendsScreenState createState() => _TravelFriendsScreenState();
}

class _TravelFriendsScreenState extends State<TravelFriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MagicContainer(
        body: <Widget>[
          TravelFriendsHeader(),
          SizedBox(height: 20),
          TravelFriendsBody(),
        ],
      ),
    );
  }
}
