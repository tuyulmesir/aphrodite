import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import 'palette.dart';

class Screen extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final Widget body;
  final bool elevatedHeader;
  final PreferredSizeWidget bottom;
  final Widget bottomNavigationBar;
  final VoidCallback onBackPressed;

  Screen({
    this.title,
    this.leadingIcon = Icons.close,
    this.body,
    this.elevatedHeader = true,
    this.bottom,
    this.bottomNavigationBar,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      leading: IconButton(
        icon: Icon(
          leadingIcon,
          size: Platform.isAndroid ? null : 32.0,
        ),
        onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
      ),
      title: Text(title),
      centerTitle: Platform.isIOS,
      elevation: Platform.isAndroid && elevatedHeader ? 4.0 : 0,
      bottom: bottom,
    );

    return Scaffold(
      appBar: appBar,
      body: body,
      backgroundColor: Palette.of(context).primary[50],
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
