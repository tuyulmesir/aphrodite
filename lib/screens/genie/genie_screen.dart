import 'dart:math';

import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';

import 'widgets/genie_header.dart';

import 'widgets/steps/index.dart';
import 'widgets/steps/summary_step.dart';

class GenieScreen extends StatefulWidget {
  @override
  _GenieScreenState createState() => _GenieScreenState();
}

class _GenieScreenState extends State<GenieScreen> {
  void incrementStep() {
    setState(() {
      step = min(step + 1, 5);
    });
  }

  void setAirport(String airport) {
    setState(() {
      airport = airport;
    });
  }

  void setBudget(String airport) {
    setState(() {
      budget = budget;
    });
  }

  void setDate(DateTime date) {
    setState(() {
      date = date;
    });
  }

  void setThemes(Map<String, bool> themes) {
    setState(() {
      themes = themes;
    });
  }

  void onBack() {
    if (step == 0) {
      Navigator.of(context).pop();
    } else {
      setState(() {
        step -= 1;
      });
    }
  }

  Widget _showStep() {
    if (step == 0) {
      return IntroStep(incrementStep: incrementStep);
    } else if (step == 1) {
      return AirportStep(incrementStep: incrementStep, setAirport: setAirport);
    } else if (step == 2) {
      return BudgetStep(incrementStep: incrementStep, setBudget: setBudget);
    } else if (step == 3) {
      return DateStep(incrementStep: incrementStep, setDate: setDate);
    } else if (step == 4) {
      return TripThemeStep(incrementStep: incrementStep, setThemes: setThemes);
    } else {
      return SummaryStep();
    }
  }

  int step;
  String airport;
  String budget;
  DateTime date;
  Map<String, bool> themes;

  @override
  void initState() {
    super.initState();
    step = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MagicContainer(
        body: <Widget>[
          GenieHeader(isIntro: step == 0 ? true : false, onBack: onBack),
          SizedBox(height: 20),
          _showStep(),
        ],
      ),
    );
  }
}
