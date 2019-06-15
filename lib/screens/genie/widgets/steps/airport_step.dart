import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';

class AirportStep extends StatefulWidget {
  final VoidCallback incrementStep;
  final setAirport;

  AirportStep({
    this.incrementStep,
    this.setAirport,
  });


  @override
  _AirportStepState createState() => _AirportStepState();
}

class _AirportStepState extends State<AirportStep> {

  String airport;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Which airport do you want to depart from?",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[200],
            ),
            child: DropDownFormField(
              hintText: 'Please choose your departure airport',
              value: airport,
              onChanged: (value) {
                setState(() {
                  widget.setAirport(value);
                  airport = value;
                });
              },
              dataSource: [
                {
                  "display": "Soekarno-Hatta International Airport (CGK)",
                  "value": "CGK",
                },
                {
                  "display": "Denpasar International Airport (DPN)",
                  "value": "DPN",
                },
              ],
              textField: 'display',
              valueField: 'value',
            ),
          ),
          SizedBox(height: 200),
          Center(
            child: MagicButton(
              text: "     Next     ",
              callback: airport != null ? widget.incrementStep : null,
            ),
          )
        ],
      ),
    );
  }
}
