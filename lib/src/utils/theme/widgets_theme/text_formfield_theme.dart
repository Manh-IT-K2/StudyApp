import 'package:firebase_app/src/constants/colors.dart';
import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
    prefixIconColor: tSecondaryColor,
    suffixIconColor: tSecondaryColor,
    border: OutlineInputBorder(),
    floatingLabelStyle: TextStyle(color: tSecondaryColor),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: tSecondaryColor)),
  );

  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
    prefixIconColor: tPrimaryColor,
    suffixIconColor: tPrimaryColor,
    border: OutlineInputBorder(),
    floatingLabelStyle: TextStyle(color: tPrimaryColor),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: tPrimaryColor)),
  );
}
