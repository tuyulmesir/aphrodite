import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';

import 'discover/discover_tab.dart';
import 'plans/plans_tab.dart';
import 'account/account_tab.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<NavigableScreen> screens = <NavigableScreen>[
      DiscoverTab(),
      PlansTab(),
      AccountTab(),
    ];

    return TabbedScreen(screens: screens);
  }
}
