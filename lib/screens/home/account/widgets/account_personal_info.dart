import 'package:flutter/material.dart';
import 'account_menu_list.dart';
import 'account_tile.dart';

import 'package:magic_carpet/routes.dart';

class AccountPersonalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text("S", style: TextStyle(fontSize: 45))),
        SizedBox(height: 25),
        Text(
          "Scott Moses Sunarto",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 65),
        AccountMenuList(
          tiles: <AccountTile>[
            AccountTile(
              text: 'TravelFriends',
              imageUrl: 'images/help.png',
              onTap: (context) {
                Navigator.of(context).pushNamed(Routes.travelFriends);
              },
            ),
            AccountTile(
              text: 'Settings',
              imageUrl: 'images/help.png',
            ),
            AccountTile(
              text: 'Terms & Conditions',
              imageUrl: 'images/help.png',
            ),
            AccountTile(
              text: 'Privacy Policy',
              imageUrl: 'images/help.png',
            ),          
          ],
        ),
      ],
    );
  }
}
