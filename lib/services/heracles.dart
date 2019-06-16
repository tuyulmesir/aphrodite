import 'package:magic_carpet/types.dart';

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
}
