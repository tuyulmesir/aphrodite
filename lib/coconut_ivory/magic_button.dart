import 'package:flutter/material.dart';

class MagicButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  MagicButton({
    @required this.text,
    @required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: callback != null ? Color(0xFF4A90E2) : Colors.grey,
            blurRadius: 29,
            spreadRadius: -6,
            offset: Offset(
              0,
              3,
            ),
          ),
        ],
      ),
      child: FlatButton(
        padding: EdgeInsets.symmetric(horizontal: 38, vertical: 14),
        child: Text(this.text),
        color: Color(0xFF4A90E2),
        disabledColor: Colors.grey,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.5),
        ),
        onPressed: callback != null ? () => this.callback() : null,      
      ),
    );
  }
}
