import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';
import 'package:magic_carpet/screens/home/plans/widgets/plans_entry/plans_entry_card.dart';

class SummaryStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 50),
          child: Image.asset(
            'images/genie.png',
            width: 250,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Genie have decided",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Genie had given his professional, "
            "mythical, magical opinion",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
        Text(
          "",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 60),
        PlansEntryCard()
      ],
    );
  }
}
