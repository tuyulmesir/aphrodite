import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';

import 'plans_screen.dart';

class PlansTab extends NavigableScreen {
  PlansTab()
      : super(
          body: PlansScreen(),
          navBarItem: BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            title: Container(height: 0),
          ),
        );
}
