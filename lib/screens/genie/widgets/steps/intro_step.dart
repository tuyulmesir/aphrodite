import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';

class IntroStep extends StatelessWidget {
  final VoidCallback incrementStep;

  IntroStep({
    this.incrementStep,
  });

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
              "Meet Genie",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.blue
              ),
            ),
          ],
        ),
        Text(
          "your personal trip expert.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 40),
        Text(
          "To provide you with the best results,\nwe would like you to answer some questions.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 60),
        MagicButton(
          text: "Let's Go",
          callback: incrementStep,
        ),
      ],
    );
  }
}
