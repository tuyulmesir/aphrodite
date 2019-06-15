import 'dart:async';

import 'package:flutter/material.dart';
import 'package:landx_app/coconut_ivory/coconut_ivory.dart';

typedef CooldownEvent = Future<DateTime> Function();

/// A material design "outline button" with cooldown.
class CooldownButton extends StatefulWidget {
  static const _defaultCooldown = Duration(seconds: 5);

  final Duration preemptiveCooldown;
  final CooldownEvent onPressed;
  final Widget child;

  const CooldownButton({
    Key key,
    this.onPressed,
    @required this.child,
    this.preemptiveCooldown = _defaultCooldown,
  }) : super(key: key);

  @override
  _CooldownButtonState createState() => _CooldownButtonState();
}

class _CooldownButtonState extends State<CooldownButton>
    with AutomaticKeepAliveClientMixin<CooldownButton> {
  static final _epochZero = DateTime.fromMillisecondsSinceEpoch(0);
  static const Duration refreshRate = Duration(seconds: 1);

  get preemptiveCooldown => widget.preemptiveCooldown;
  get child => widget.child;

  Timer periodicTimer;
  bool active = true;
  DateTime openedAt = _epochZero;
  int secondsRemaining = 0;

  @override
  Widget build(BuildContext context) {
    MaterialColor primary = Palette.of(context).primary;
    MaterialAccentColor accent = Palette.of(context).accent;

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: OutlineButton(
                disabledBorderColor: primary,
                disabledTextColor: primary,
                textColor: accent,
                borderSide: BorderSide(color: accent),
                child: child,
                onPressed:
                    active && widget.onPressed != null ? onPressed : null,
              ),
            )
          ],
        ),
        active && widget.onPressed != null
            ? Container()
            : Center(child: Text('$secondsRemaining s'))
      ],
    );
  }

  @override
  void dispose() {
    periodicTimer?.cancel();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  void lockButton() => setState(() => active = false);
  void releaseButton() => setState(() => active = true);

  void onPressed() async {
    lockButton();
    secondsRemaining = widget.preemptiveCooldown.inSeconds - 1;
    openedAt = DateTime.now().add(preemptiveCooldown);
    periodicTimer = Timer.periodic(refreshRate, onTick);
    openedAt = await widget
        .onPressed()
        .catchError((error) => _epochZero)
        .timeout(preemptiveCooldown, onTimeout: () => _epochZero);
  }

  void onTick(Timer timer) {
    if (DateTime.now().isAfter(openedAt)) {
      timer.cancel();
      releaseButton();
    } else {
      setState(() =>
          secondsRemaining = openedAt.difference(DateTime.now()).inSeconds);
    }
  }
}
