import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/magic_button.dart';
import 'package:magic_carpet/routes.dart';

import 'plans_entry_card.dart';

class PlansEntry extends StatelessWidget {
  final List plans;

  PlansEntry({this.plans});

  Widget _showPlans() {
    return ListView(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        PlansEntryCard(),
        SizedBox(width: 30),
        PlansEntryCard(),
        SizedBox(width: 30),
        PlansEntryCard(),
      ],
    );
  }

  Widget _showGenie(BuildContext context) {
    print("boop");
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 100, bottom: 50),
          child: Image.asset('images/no_plan.png', width: 300),
        ),
        Text(
          "No created plans",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 40),
        Text(
          "Ready to make new plans?",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 60),
        MagicButton(
          text: "Take Me There",
          callback: () => Navigator.of(context).pushNamed(Routes.genie),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: plans.isNotEmpty ? _showPlans() : _showGenie(context));
  }
}
