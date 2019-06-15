import 'dart:io' show Platform;
import 'package:flutter/material.dart';

class WideButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  final _android = Platform.isAndroid;

  WideButton(
    this.label, {
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          child: ButtonTheme(
            minWidth: _android ? 220.0 : MediaQuery.of(context).size.width - 32,
            child: RaisedButton(
              elevation: _android ? 2.0 : 3.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(_android ? 4.0 : 3.0),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              color: Color(0xFF2DBE60),
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: _android ? 14.0 : 17.0,
                  height: _android ? 1.14 : 1.29,
                  letterSpacing: _android ? 1.25 : 0.41,
                ),
              ),
              onPressed: onPressed,
            ),
          ),
        );
      },
    );
  }
}
