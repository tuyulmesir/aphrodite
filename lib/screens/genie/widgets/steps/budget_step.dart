import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';

class BudgetStep extends StatefulWidget {
  final VoidCallback incrementStep;
  final setBudget;

  BudgetStep({
    this.incrementStep,
    this.setBudget,
  });


  @override
  _BudgetStepState createState() => _BudgetStepState();
}

class _BudgetStepState extends State<BudgetStep> {

  String budget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "How much do you want to spend per person?",
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
              hintText: 'Please choose your budget range',
              value: budget,
              onChanged: (value) {
                setState(() {
                  widget.setBudget(value);
                  budget = value;
                });
              },
              dataSource: [
                {
                  "display": "Below Rp 3.000.000",
                  "value": "3000000000",
                },
                {
                  "display": "Rp 3.000.000 - Rp 5.000.000",
                  "value": "5000000000",
                },
                {
                  "display": "Rp 5.000.000 - Rp 7.000.000",
                  "value": "7000000000",
                },
                {
                  "display": "Rp 7.000.000 - Rp 9.000.000",
                  "value": "9000000000",
                },
                {
                  "display": "Above Rp 9.000.000",
                  "value": "1000000000000000",
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
              callback: budget != null ? widget.incrementStep : null,
            ),
          )
        ],
      ),
    );
  }
}
