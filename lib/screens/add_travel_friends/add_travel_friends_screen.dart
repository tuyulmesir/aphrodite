import 'package:flutter/material.dart';

import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';

import 'widgets/index.dart';

class AddTravelFriendsScreen extends StatefulWidget {
  @override
  _AddTravelFriendsScreenState createState() => _AddTravelFriendsScreenState();
}

class _AddTravelFriendsScreenState extends State<AddTravelFriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MagicContainer(
        body: <Widget>[
          AddTravelFriendsHeader(),
          SizedBox(height: 20),
          AddTravelFriendsBody(),
        ],
      ),
    );
    ;
  }
}
