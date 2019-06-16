import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';

import 'account_screen.dart';

class AccountTab extends NavigableScreen {
  AccountTab()
      : super(
          body: AccountScreen(),
          navBarItem: BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Container(height: 0),
          ),
        );
}
