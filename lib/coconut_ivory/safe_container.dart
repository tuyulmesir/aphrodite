import 'package:flutter/material.dart';

class MagicContainer extends StatelessWidget {
  @required final List<Widget> body;

  MagicContainer({
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 25),
        child: ListView(
          children: this.body,
        ),
      )
    ;
  }
}
