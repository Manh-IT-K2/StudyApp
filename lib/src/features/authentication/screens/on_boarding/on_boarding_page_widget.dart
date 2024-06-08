import 'package:firebase_app/src/constants/sizes.dart';
import 'package:firebase_app/src/features/authentication/models/model_on_boarding.dart';
import 'package:flutter/material.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(tDefaulSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: AssetImage(model.image), height: size.height * 0.4,),
          Column(
            children: [
              Text(
                model.title,
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                model.subTitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
           Text(model.counterText, style: TextStyle(fontWeight: FontWeight.bold),),
          const SizedBox(height: 40.0,),
        ],
      ),
    );
  }
}
