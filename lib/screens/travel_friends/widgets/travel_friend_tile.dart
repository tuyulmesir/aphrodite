import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';

class TravelFriendTile extends StatefulWidget {
  static const Icon _defaultTrailing = Icon(Icons.chevron_right);

  final String text;
  final String imageUrl;
  final void Function(BuildContext context) onTap;
  final Widget trailing;

  const TravelFriendTile({
    Key key,
    this.text,
    this.imageUrl,
    this.onTap,
    this.trailing = _defaultTrailing,
  }) : super(key: key);

  @override
  _TravelFriendTileState createState() => _TravelFriendTileState();
}

class _TravelFriendTileState extends State<TravelFriendTile> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    print(isSelected);
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Color(0x25000000),
            blurRadius: 20,
            spreadRadius: -10,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      ),
      child: Material(
        color: isSelected ? Colors.blue : Colors.white,
        child: ListTile(
          title: Text(
            widget.text,
            style: TextStyle(fontWeight: FontWeight.w600, color: isSelected ? Colors.white : Colors.black),
          ),
          trailing: Icon(Icons.chevron_right, color: isSelected ? Colors.white : Colors.black),
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
        ),
      ),
    );
  }
}
