import 'package:flutter/material.dart';

import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddTravelFriendsBody extends StatefulWidget {
  @override
  _AddTravelFriendsBodyState createState() => _AddTravelFriendsBodyState();
}

class _AddTravelFriendsBodyState extends State<AddTravelFriendsBody> {
  _addTravelFriends(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> travelFriends = prefs.getStringList('travel-friends') ?? [];
    travelFriends.add(name);
    await prefs.setStringList('travel-friends', travelFriends);
    Navigator.of(context).pop(true);
  }

  final passportNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Fill the form below with your friend's travel info.",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 40),
          LabeledTextInput(
            "Passport Name",
            type: TextInputType.text,
            color: Colors.white,
            controller: passportNameController,
            validator: (value) => value.isEmpty ? "Must be filled" : null,
          ),
          SizedBox(height: 20),
          LabeledTextInput(
            "Passport Number",
            type: TextInputType.text,
            color: Colors.white,
            validator: (value) => value.isEmpty ? "Must be filled" : null,
          ),
          SizedBox(height: 20),
          LabeledTextInput(
            "Email",
            type: TextInputType.emailAddress,
            color: Colors.white,
            validator: (value) => value.isEmpty ? "Must be filled" : null,
          ),
          SizedBox(height: 20),
          LabeledTextInput(
            "Mobile Number",
            type: TextInputType.number,
            color: Colors.white,
            validator: (value) => value.isEmpty ? "Must be filled" : null,
          ),
          SizedBox(height: 40),
          Center(
            child: MagicButton(
              text: "Add my friend",
              callback: () {
                _addTravelFriends(passportNameController.text);
              },
            ),
          ),
        ],
      ),
    );
  }
}
