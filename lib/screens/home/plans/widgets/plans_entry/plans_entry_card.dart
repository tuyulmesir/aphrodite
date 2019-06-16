import 'package:flutter/material.dart';
import 'package:magic_carpet/color_palette.dart';
import 'package:magic_carpet/routes.dart';

class PlansEntryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(Routes.trip),
      behavior: HitTestBehavior.opaque,
      child: Row(
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              image: DecorationImage(
                                  image: AssetImage('images/mbambacakep.webp'),
                                  fit: BoxFit.cover),
                            ),
                            child: Text(""),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text("My New Plan",
                                            style: TextStyle(
                                              color: ColorPalette.textGrey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                      Text(
                                        "On Watchlist",
                                        style: TextStyle(
                                            color: Colors.red[700],
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: <Widget>[
                                      Text("1 Jan 2019 - 2 Jan 2019",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: ColorPalette.textGrey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ],
                                  ),
                                  SizedBox(height: 25),
                                  Row(
                                    children: <Widget>[
                                      Text("Now only ",
                                          style: TextStyle(color: Colors.grey)),
                                      Text("Rp 123.123.123",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      Text(
                                        "/pax",
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 5,
                                          horizontal: 5,
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(Icons.arrow_drop_down,
                                                color: Colors.white, size: 14),
                                            Text(
                                              "5%",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          ],
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
          ),
        ],
      ),
    );
  }
}
