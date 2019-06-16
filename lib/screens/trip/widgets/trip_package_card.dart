import 'dart:math';

import 'package:flutter/material.dart';
import 'package:magic_carpet/color_palette.dart';

class TripPackageCard extends StatelessWidget {
  final String title;
  final String description;

  const TripPackageCard({
    Key key,
    @required this.title,
    @required this.description,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 40),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x25000000),
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: Offset(
                    0,
                    0,
                  ),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                title,
                                style: TextStyle(
                                  color: ColorPalette.textGrey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: <Widget>[
                                  Text(
                                    description.substring(
                                        0, min(46, description.length)),
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: ColorPalette.textGrey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
