import 'package:flutter/material.dart';

import 'pages/home_page/home_page.dart';

class Routes {
  static const String home = "/";
  static final routes = <String, WidgetBuilder>{
    home: (context) => HomePage(
          title: 'Calo',
        ),
  };
}
