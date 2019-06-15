import 'package:flutter/material.dart';

import 'palette.dart';

class _Step {
  final int index;
  final String indicator;
  final Widget description;

  const _Step({this.index, this.indicator, this.description});
}

class StepIndicator extends StatelessWidget {
  static final double _maxDescriptionWidth = 50;

  final List<_Step> steps;
  final int currentStep;

  StepIndicator.fromDescriptions({
    @required Iterable<String> descriptions,
    @required int currentStep,
  }) : this._fromDescriptions(
            descriptions: descriptions.toList(), currentStep: currentStep);

  StepIndicator._fromDescriptions({
    @required List<String> descriptions,
    @required this.currentStep,
  }) : this.steps = Iterable.generate(
          descriptions.length,
          (index) => _Step(
                index: index,
                indicator: (index + 1).toString(),
                description: Center(
                  child: Text(
                    descriptions.elementAt(index),
                    style: TextStyle(color: Colors.white, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
        ).toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: (_maxDescriptionWidth - RoundStepIndicator.size) / 2),
          child: Row(
            children: steps
                .map((step) => RoundStepIndicator(
                      indicator: step.indicator,
                      active: step.index <= currentStep,
                    ))
                .expand((widget) => [
                      widget,
                      Expanded(child: Divider(color: Colors.white)),
                    ])
                .take(2 * steps.length - 1)
                .toList(),
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: steps
              .map((step) => Container(
                  width: _maxDescriptionWidth, child: step.description))
              .expand((widget) => [
                    widget,
                    Expanded(
                      child: Divider(
                        color: Colors.transparent,
                      ),
                    )
                  ])
              .take(2 * steps.length - 1)
              .toList(),
        ),
      ],
    );
  }
}

class RoundStepIndicator extends StatelessWidget {
  static final double size = 25;
  final String indicator;
  final bool active;

  const RoundStepIndicator({Key key, this.indicator, this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaterialColor primary = Palette.of(context).primary;
    TextStyle activeStyle = TextStyle(color: primary[600]);
    TextStyle inactiveStyle = TextStyle(color: primary[300]);
    return Container(
      alignment: Alignment.center,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: active ? Colors.white : primary[600],
        border: active ? null : Border.all(color: primary[300]),
        shape: BoxShape.circle,
      ),
      child: Text(indicator, style: active ? activeStyle : inactiveStyle),
    );
  }
}
