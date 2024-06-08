import 'package:firebase_app/src/utils/theme/widgets_theme/elevated_button_theme.dart';
import 'package:firebase_app/src/utils/theme/widgets_theme/outlined_button_theme.dart';
import 'package:firebase_app/src/utils/theme/widgets_theme/text_formfield_theme.dart';
import 'package:firebase_app/src/utils/theme/widgets_theme/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._(); //to avoid creating instances -- để tránh tạo ra các trường hợp

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButton,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButton,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButton,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButton,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme
  );
}
