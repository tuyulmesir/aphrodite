import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInput extends TextFormField {
  static InputDecorationTheme _theme = InputDecorationTheme(
    labelStyle: TextStyle(color: Color(0xFF5E798D)),
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(
      10.0,
      10.0,
      10.0,
      10.0,
    ),
    border: InputBorder.none,
    focusedBorder:OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(4.0),
        topRight: Radius.circular(4.0),
      ),
      borderSide: BorderSide(
        color: Color(0xFF425766),
        width: 2.0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(4.0),
        topRight: Radius.circular(4.0),
      ),
      borderSide: BorderSide(
        color: Color(0xFFB00020),
        width: 2.0,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(4.0),
        topRight: Radius.circular(4.0),
      ),
      borderSide: BorderSide(
        color: Color(0xFFB00020),
        width: 2.0,
      ),
    ),
    errorStyle: TextStyle(
      color: Color(0xFFB00020),
    ),
  );

  TextInput(
    String label, {
    String hintText,
    TextInputType type,
    bool obscureText,
    Color color = const Color(0x66D8D8D8),
    TextEditingController controller,
    String Function(String) validator,
    void Function(String) onSaved,
    Widget suffixIcon,
    String prefixText,
    int maxLength,
    List<TextInputFormatter> inputFormatters,
    bool autofocus = false,
    FocusNode focusNode,
    InputDecoration decoration,
  }) : super(
          keyboardType: type ?? TextInputType.text,
          autofocus: autofocus,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          obscureText: obscureText ?? false,
          controller: controller,
          decoration: (decoration ??
                  InputDecoration(
                    hintText: hintText,
                    fillColor: color,
                    suffixIcon: suffixIcon,
                    prefixText: prefixText,
                  ))
              .copyWith(labelText: label == '' ? null : label)
              .applyDefaults(_theme),
          validator: validator,
          onSaved: onSaved,
          focusNode: focusNode,
        );
}
