import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';

import 'discover_screen.dart';

class DiscoverTab extends NavigableScreen {
  DiscoverTab()
      : super(
          body: DiscoverScreen(),
          navBarItem: BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Container(height: 0),
          ),
        );
}
