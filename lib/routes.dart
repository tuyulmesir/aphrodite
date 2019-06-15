import 'package:flutter/material.dart';

import 'screens/home/home.dart';
import 'screens/genie/genie_screen.dart';
import 'screens/trip/trip_screen.dart';

class Routes {
  static const String home = "/";
  static const String genie = "/genie";
  static const String trip = "/trip";
  static final routes = <String, WidgetBuilder>{
    home: (context) => Home(),
    genie: (context) => GenieScreen(),
    trip: (context) => TripScreen(),
  };
}
