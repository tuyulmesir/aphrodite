import 'package:flutter/material.dart';

class TripHeader extends StatelessWidget {
  final bool showButton;

  TripHeader({this.showButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back_ios),
          ),
          Expanded(
            child: SizedBox(width: 0),
          ),
          OutlineButton.icon(
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            borderSide: BorderSide(color: Colors.blue),
            textColor: Colors.blue,
            icon: Icon(Icons.notifications),
            label: Text("Track Price"),
            onPressed: () => print("boop"),
          )
        ],
      ),
    );
  }
}
