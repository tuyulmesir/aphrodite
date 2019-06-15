import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import 'screen.dart';
import 'wide_button.dart';

class BottomActionScreen extends Screen {
  BottomActionScreen({
    String title,
    IconData leadingIcon = Icons.close,
    PreferredSizeWidget bottom,
    String bottomButtonTitle,
    Widget body,
    bool elevatedHeader = true,
    Alignment bottomAlignment,
    double bottomHeight,
    Widget bottomWidget,
    VoidCallback onBackPressed,
    VoidCallback onBottomButtonPressed,
  }) : super(
          title: title,
          leadingIcon: leadingIcon,
          body: body,
          elevatedHeader: elevatedHeader,
          bottom: bottom,
          bottomNavigationBar: Container(
            alignment: bottomAlignment ?? Alignment.center,
            height: bottomHeight ?? (Platform.isAndroid ? 70.0 : 80.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Platform.isAndroid
                  ? null
                  : Border(
                      top: BorderSide(
                        style: BorderStyle.solid,
                        width: 1.0,
                        color: Colors.black38,
                      ),
                    ),
              borderRadius: Platform.isAndroid
                  ? BorderRadius.vertical(
                      top: Radius.circular(8.0),
                    )
                  : null,
              boxShadow: Platform.isAndroid
                  ? [
                      BoxShadow(
                        color: Color(0x33000000),
                        offset: Offset(0, 1.0),
                        blurRadius: 5.0,
                      ),
                      BoxShadow(
                        color: Color(0x1E000000),
                        offset: Offset(0, 3.0),
                        blurRadius: 1.0,
                        spreadRadius: -2.0,
                      ),
                      BoxShadow(
                        color: Color(0x23000000),
                        offset: Offset(0, 2.0),
                        blurRadius: 2.0,
                      ),
                    ]
                  : null,
            ),
            child: bottomWidget ??
                WideButton(
                  bottomButtonTitle ?? '',
                  onPressed: onBottomButtonPressed,
                ),
          ),
          onBackPressed: onBackPressed,
        );
}
