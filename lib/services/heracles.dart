import 'dart:convert';

import 'package:magic_carpet/types.dart';

import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'package:decimal/decimal.dart';

import 'package:flutter/material.dart';

class Heracles extends Model {
  DateTime start;
  Future<List<Package>> fetchPackages() async {
    List<Package> packages = [Package(name: "Test", price: Decimal.fromInt(1))];
    return packages;
  }

  static Heracles of(BuildContext context, {rebuildOnChange = true}) {
    return ScopedModel.of<Heracles>(context, rebuildOnChange: rebuildOnChange);
  }

  void setStart(DateTime date) {
    start = date;
    notifyListeners();
  }

  Future<dynamic> travelAdvisor() async {
    http.Response r = await http.get(
        'https://us-central1-magic-carpet-7e58b.cloudfunctions.net/getTrips?start=${start.millisecondsSinceEpoch}');
    return jsonDecode(r.body)[0];
  }
}
