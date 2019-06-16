import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/magic_button.dart';
import 'package:magic_carpet/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'travel_friend_tile.dart';

class TravelFriendsBody extends StatefulWidget {
  @override
  _TravelFriendsBodyState createState() => _TravelFriendsBodyState();
}

class _TravelFriendsBodyState extends State<TravelFriendsBody> {
  List<String> travelFriends = [];

  _fetchTravelFriends() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      travelFriends = prefs.getStringList('travel-friends') ?? [];
    });
  }

  Widget _showTravelFriends() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: travelFriends.length,
      itemBuilder: (BuildContext context, int i) {
        return TravelFriendTile(
          text: travelFriends[i],
        );
      },
    );
  }

  Widget _showPlaceholder(BuildContext context) {
    print("boop");
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 60, bottom: 50),
          child: Image.asset('images/no_travel_friends.png', height: 200),
        ),
        Text(
          "Empty TravelFriends",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 40),
        Text(
          "Add your frequent travel friend for\nconvenient booking.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 60),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchTravelFriends();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: travelFriends.isNotEmpty
              ? _showTravelFriends()
              : _showPlaceholder(context),
        ),
        SizedBox(height: 50),
        MagicButton(
          text: "Add my friend",
          callback: () async {
            var result =
                await Navigator.of(context).pushNamed(Routes.addTravelFriends);
            if (result) {
              setState(() {});
            }
          },
        ),
      ],
    );
  }
}
