import 'text_input.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' hide TextInput;

class LabeledTextInput extends StatelessWidget {
  final String label;
  final String hintText;
  final TextInputType type;
  final Color color;
  final bool obscureText;
  final TextEditingController controller;
  final String Function(String) validator;
  final void Function(String) onSaved;
  final Widget suffixIcon;
  final String prefixText;
  final int maxLength;
  final List<TextInputFormatter> inputFormatters;
  final bool autofocus;
  final InputDecoration decoration;

  LabeledTextInput(
    this.label, {
    this.hintText,
    this.type,
    this.color,
    this.obscureText,
    this.controller,
    this.validator,
    this.onSaved,
    this.suffixIcon,
    this.prefixText,
    this.maxLength,
    this.inputFormatters,
    this.autofocus = false,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: TextStyle(fontSize: 12, color: Colors.black)),
        SizedBox(height: 5),
        TextInput(
          "",
          hintText: hintText,
          type: type,
          color: color,
          obscureText: obscureText,
          controller: controller,
          validator: validator,
          onSaved: onSaved,
          suffixIcon: suffixIcon,
          prefixText: prefixText,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          autofocus: autofocus,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
