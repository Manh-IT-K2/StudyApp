import 'package:firebase_app/src/constants/colors.dart';
import 'package:firebase_app/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  /* -- Light themw -- */
  static final lightElevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    foregroundColor: tWhiteColor,
    backgroundColor: tSecondaryColor,
    side: const BorderSide(color: tSecondaryColor),
    padding: const EdgeInsets.symmetric(vertical: tWelcomeButton),
    
  ));

  /* -- Dark themw -- */
  static final darkElevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    foregroundColor: tSecondaryColor,
    backgroundColor: tWhiteColor,
    side: const BorderSide(color: tSecondaryColor),
    padding: const EdgeInsets.symmetric(vertical: tWelcomeButton),
  ));
}
