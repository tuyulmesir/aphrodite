import 'package:flutter/material.dart';

class _InheritedPalette extends InheritedWidget {
  const _InheritedPalette(
      {Key key, @required this.palette, @required Widget child})
      : assert(palette != null),
        super(key: key, child: child);

  final Palette palette;

  @override
  bool updateShouldNotify(_InheritedPalette old) =>
      palette.data != old.palette.data;
}

class Palette extends StatelessWidget {
  final Widget child;
  final PaletteData data;

  const Palette({
    Key key,
    this.data,
    this.child,
  }) : super(key: key);

  static PaletteData of(BuildContext context) {
    final _InheritedPalette inheritedPalette =
        context.inheritFromWidgetOfExactType(_InheritedPalette);

    return inheritedPalette?.palette?.data;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedPalette(
      palette: this,
      child: child,
    );
  }
}

class PaletteData {
  final Color primary;
  final MaterialAccentColor accent;

  final Color success;
  final Color error;

  PaletteData({
    @required this.primary,
    @required this.accent,
    @required this.success,
    @required this.error,
  });
  PaletteData.defaultPalette()
      : this(
          primary: Colors.white,
          accent: Colors.blueAccent,
          success: Colors.green,
          error: Colors.red,
        );
}
