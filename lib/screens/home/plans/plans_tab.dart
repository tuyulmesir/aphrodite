import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';

import 'plans_screen.dart';

class PlansTab extends NavigableScreen {
  PlansTab()
      : super(
          body: PlansScreen(),
          navBarItem: BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Container(height: 0),
          ),
        );
}
