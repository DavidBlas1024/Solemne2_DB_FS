import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hinText,
    required String labelText,
    IconData? prefixicon,
  }) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: const Color.fromARGB(255, 11, 58, 82)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: const Color.fromARGB(255, 1, 9, 25),
          width: 3,
        ),
      ),

      hintText: hinText,
      labelText: labelText,

      prefixIcon: prefixicon != null
          ? Icon(prefixicon, color: const Color.fromARGB(255, 11, 39, 54))
          : null,
    );
  }
}
