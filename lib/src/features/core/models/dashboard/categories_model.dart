import 'package:flutter/material.dart';

class DashBoardCategoriesModel{
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashBoardCategoriesModel(
    this.title,
    this.heading,
    this.subHeading,
    this.onPress,
  );

  static List<DashBoardCategoriesModel> list = [
    DashBoardCategoriesModel('JS', 'Java Script', '10 Lessons', null),
    DashBoardCategoriesModel('F', 'Flutter', '11 Lessons', null),
    DashBoardCategoriesModel('H', 'HTML', '8 Lessons', null),
    DashBoardCategoriesModel('K', 'Kotlin', '20 Lessons', null),
    DashBoardCategoriesModel('P', 'Python', '100 Lessons', null),
  ];
}