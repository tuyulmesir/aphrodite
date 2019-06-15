import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'coconut_ivory/coconut_ivory.dart';
import 'routes.dart';
import 'services/heracles.dart';

void main() => runApp(Aphrodite());

class Aphrodite extends StatefulWidget {
  @override
  _AphroditeState createState() => _AphroditeState();
}

class _AphroditeState extends State<Aphrodite> {
  Heracles service = Heracles();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme();
    ThemeData themeData = ThemeData(
      textTheme: textTheme,
    );
    PaletteData paletteData = PaletteData.defaultPalette();
    return ScopedModel<Heracles>(
      model: Heracles(),
      child: Palette(
        data: paletteData,
        child: MaterialApp(
          title: 'Calo',
          theme: themeData,
          routes: Routes.routes,
        ),
      ),
    );
  }
}
