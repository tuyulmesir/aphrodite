import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';
import 'widgets/index.dart';

class TripScreen extends StatelessWidget {
  Future<Map> query() async {
    http.Response r = await http.get(
        'https://us-central1-magic-carpet-7e58b.cloudfunctions.net/getTrips?start=1561420800000');
    print(jsonDecode(r.body)[0]);
    return jsonDecode(r.body)[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Refreshable<Map>(
        fetcher: query,
        onSuccess: (context, data) {
          return ListView(
            padding: EdgeInsets.only(top: 25),
            children: <Widget>[
              TripHeader(),
              SizedBox(height: 20),
              TripInfo(title: data['title'], description: data['description']),
              SizedBox(height: 50),
              TripPackage(
                data['arrival'],
                data['departure'],
                data['accomodation'],
                data['experiences'],
              ),
            ],
          );
        },
        onFailure: (context, e) => Container(),
      ),
    );
//      MagicContainer(
//        body:
//      ),
//        );
  }
}
