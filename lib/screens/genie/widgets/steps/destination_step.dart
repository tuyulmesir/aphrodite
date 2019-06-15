import 'package:flutter/material.dart';

class DestinationStep extends StatelessWidget {
  final VoidCallback incrementStep;
  final setDestination;

  DestinationStep({
    this.incrementStep,
    this.setDestination,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Choose your favourite destination",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 30),
          Text(
            "Recommendations based on your budget",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 20),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    this.setDestination('bali');
                    this.incrementStep();
                  },
                  child: DestinationCard()),
            ],
          ),
        ],
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x25000000),
                      blurRadius: 40,
                      spreadRadius: -19,
                      offset: Offset(
                        0,
                        20,
                      ),
                    ),
                  ],
                ),
                child: Container()),
          ),
        ],
      ),
    );
  }
}
