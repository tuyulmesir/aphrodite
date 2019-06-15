import 'package:flutter/material.dart';

import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';
import 'widgets/index.dart';

class TripScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MagicContainer(
        body: <Widget>[
          TripHeader(),
          SizedBox(height: 20),
          TripInfo(),
          SizedBox(height: 50),
          TripPackage(),
        ],
      ),
    );
  }
}
