import 'package:flutter/material.dart';

import 'trip_package_card.dart';

class TripPackage extends StatelessWidget {
  final Map arrival;
  final Map departure;
  final Map accomodation;
  final List experiences;
  TripPackage(
    this.arrival,
    this.departure,
    this.accomodation,
    this.experiences,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Text(
            "What's Included",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 70),
          Text(
            "Transport",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          TripPackageCard(
            title: arrival['planeId'],
            description:
                '${arrival['arrivalTime']}-${arrival['departureTime']}',
          ),
          TripPackageCard(
            title: departure['planeId'],
            description:
                '${departure['arrivalTime']}-${departure['departureTime']}',
          ),
          SizedBox(height: 20),
          Text(
            "Accomodation",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          TripPackageCard(
              title: accomodation['title'],
              description: accomodation['description']),
          Text(
            "Experience",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
        ]..addAll(
            experiences.map(
              (experience) => TripPackageCard(
                    title: experience['title'],
                    description: experience['description'],
                  ),
            ),
          ),
      ),
    );
  }
}
