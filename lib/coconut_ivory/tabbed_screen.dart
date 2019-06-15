import 'package:flutter/material.dart';

import 'palette.dart';

/// A tabbing navigation system.
///
/// It requires a [List] of [NavigableScreen] screens,
/// the initialIndex defaults to 0, as the first screen the user
/// would encounter.
///
/// Before navigating [TabbedScreen] will check the
/// [NavigableScreen.canNavigate] on that specific page, and then navigate to
/// that page if the [NavigableScreen.canNavigate] allows.
class TabbedScreen extends StatelessWidget {
  final List<NavigableScreen> screens;

  const TabbedScreen({
    Key key,
    @required this.screens,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Builder(
        builder: (context) => InternalTabbedScreen(
              screens: screens,
              controller: DefaultTabController.of(context),
            ),
      ),
      length: screens.length,
    );
  }
}

class InternalTabbedScreen extends StatefulWidget {
  final List<NavigableScreen> screens;
  final TabController controller;

  const InternalTabbedScreen({
    Key key,
    @required this.controller,
    @required this.screens,
  }) : super(key: key);

  @override
  _InternalTabbedScreenState createState() => _InternalTabbedScreenState();
}

class _InternalTabbedScreenState extends State<InternalTabbedScreen> {
  TabController get controller => widget.controller;
  List<NavigableScreen> get screens => widget.screens;
  get previousIndex => controller.previousIndex;
  get index => controller.index;

  @override
  void initState() {
    super.initState();
    controller.addListener(onChange);
  }

  @override
  void dispose() {
    controller.removeListener(onChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    NavigableScreen screen = screens[controller.index];
    return Scaffold(
      appBar: screen.appBar,
      drawer: screen.drawer,
      endDrawer: screen.endDrawer,
      body: TabBarView(
        controller: controller,
        children: screens.map((screen) => screen.body).toList(),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Palette.of(context).primary,
          primaryColor: Colors.white,
          textTheme: TextTheme(
            caption: TextStyle(color: Colors.white.withOpacity(0.38)),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: controller.index,
          onTap: (index) => controller.index = index,
          items: screens.map((screen) => screen.navBarItem).toList(),
        ),
      ),
    );
  }

  void onChange() async {
    if (await screens[index].canNavigate(context)) {
      controller.animateTo(index);
      return setState(() {});
    }
    controller.animateTo(previousIndex);
    return setState(() {});
  }
}

/// A navigable screen.
///
/// A navigable screen has a [canNavigate] method, it should returns `true` in
/// case the user is permitted to access that page, and `false` otherwise.
abstract class NavigableScreen {
  final Widget drawer;
  final Widget endDrawer;
  final Widget appBar;
  final Widget body;
  final BottomNavigationBarItem navBarItem;

  Future<bool> canNavigate(BuildContext context) async => true;

  NavigableScreen({
    this.drawer,
    this.endDrawer,
    @required this.appBar,
    @required this.body,
    @required this.navBarItem,
  });
}
