import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    this.imageColor,
    this.imageHeigh = 0.2,
    this.heighBetween,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.height,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.textAlign,
  });

  // -- variables -- declared in constructor
  final Color? imageColor;
  final double imageHeigh;
  final double? heighBetween;
  final String image, title, subtitle;
  final double height;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(image: AssetImage(image), height: size.height * height),
        Text(title, style: Theme.of(context).textTheme.headline1),
        Text(subtitle,textAlign: textAlign, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}
