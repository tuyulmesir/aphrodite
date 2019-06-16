import 'package:flutter/material.dart';

import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';
import 'package:magic_carpet/services/heracles.dart';

class DateStep extends StatefulWidget {
  final VoidCallback incrementStep;
  final setDate;

  DateStep({
    this.incrementStep,
    this.setDate,
  });

  @override
  _DateStepState createState() => _DateStepState();
}

class _DateStepState extends State<DateStep> {
  String month;
  String date;

  void incrementStep() {
    DateTime dateTime =
        DateTime(DateTime.now().year, int.parse(month), int.parse(date));
    if (dateTime.isBefore(DateTime.now())) {
      dateTime =
          DateTime(DateTime.now().year + 1, int.parse(month), int.parse(date));
    }
    Heracles.of(context).setStart(dateTime);
    widget.incrementStep();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Choose your travel date",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 30),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[200],
            ),
            child: DropDownFormField(
              hintText: 'Please choose the month',
              value: month,
              onChanged: (value) {
                setState(() {
                  month = value;
                });
              },
              dataSource: Iterable.generate(
                  12,
                  (i) => {
                        'display': [
                          'January',
                          'February',
                          'March',
                          'April',
                          'May',
                          'June',
                          'July',
                          'August',
                          'September',
                          'October',
                          'November',
                          'December'
                        ][i],
                        'value': (i + 1).toString(),
                      }).toList(),
              textField: 'display',
              valueField: 'value',
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[200],
            ),
            child: DropDownFormField(
              hintText: 'Please choose the date',
              value: date,
              onChanged: (value) {
                setState(() {
                  date = value;
                });
              },
              dataSource: Iterable.generate(
                  31,
                  (i) => {
                        'display': (i + 1).toString(),
                        'value': (i + 1).toString()
                      }).toList(),
              textField: 'display',
              valueField: 'value',
            ),
          ),
          SizedBox(height: 150),
          Center(
            child: MagicButton(
              text: "     Next     ",
              callback: date != null && month != null ? incrementStep : null,
            ),
          )
        ],
      ),
    );
  }
}
