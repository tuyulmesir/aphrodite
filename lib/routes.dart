import 'package:flutter/material.dart';

import 'screens/booking.dart';
import 'screens/genie/widgets/steps/payment_screen.dart';
import 'screens/home/home.dart';
import 'screens/genie/genie_screen.dart';
import 'screens/trip/trip_screen.dart';
import 'screens/travel_friends/travel_friends_screen.dart';
import 'screens/add_travel_friends/add_travel_friends_screen.dart';

class Routes {
  static const String home = "/";
  static const String genie = "/genie";
  static const String booking = "/booking";
  static const String payment = "/payment";
  static const String trip = "/trip";
  static const String travelFriends = "/travelFriends";
  static const String addTravelFriends = "/addTravelFriends";
  static final routes = <String, WidgetBuilder>{
    home: (context) => Home(),
    booking: (context) => BookingScreen(),
    payment: (context) => PaymentScreen(),
    genie: (context) => GenieScreen(),
    trip: (context) => TripScreen(),
    travelFriends: (context) => TravelFriendsScreen(),
    addTravelFriends: (context) => AddTravelFriendsScreen(),
  };
}
