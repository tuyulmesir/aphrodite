import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';

class ExplorePlaceholder extends StatelessWidget {
  static const int _count = 5;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) => PropertyCardPlaceholder(),
      separatorBuilder: (context, index) => SizedBox(height: 16),
      itemCount: _count,
    );
  }
}

class PropertyCardPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatCard.raw(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Shimmer(
                      child: SizedBox(
                        height: 194
                      )
                    ),
                  ),
                ],
              ),
              Container(
                height: 216,
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Spacer(),
                      Row(
                        children: <Widget>[
                          Shimmer(child: TightChip(text: 'Giberrish')),
                          Spacer(),
                          ShimmerBox(height: 20, width: 140),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 165.0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(right: 12),
              child: Shimmer(
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
