import 'package:flutter/material.dart';

import 'travel_friend_tile.dart';

class TravelFriendMenuList extends StatelessWidget {
  final List<TravelFriendTile> tiles;

  const TravelFriendMenuList({Key key, this.tiles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Material(
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tiles.length,
          itemBuilder: (context, index) => tiles[index],
          separatorBuilder: (context, index) => Divider(height: 0),
        ),
      ),
    );
  }
}
