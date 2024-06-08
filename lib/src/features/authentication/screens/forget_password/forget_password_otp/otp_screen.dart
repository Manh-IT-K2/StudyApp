import 'package:firebase_app/src/constants/sizes.dart';
import 'package:firebase_app/src/constants/text_strings.dart';
import 'package:firebase_app/src/features/authentication/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otpController = Get.put(OTPController());
    var otp;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:const EdgeInsets.all(tDefaulSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(tOtpTitle, style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 80.0
            ),),
            Text(tOtpSubTitle.toUpperCase(), style: Theme.of(context).textTheme.headline6,),
            const SizedBox(height: 40.0,),
            const Text('$tOtpMessage Quanmanh1804@gmail.com',textAlign: TextAlign.center,),
            const SizedBox(height: 20.0,),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code) {
                otp = code;
                OTPController.instance.verifyOTP(otp);
              },
            ),
            const SizedBox(height: 20.0,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                   OTPController.instance.verifyOTP(otp);
                }, 
                child: const Text(tNext),
                ),
            ),
          ],
        ),
      )),
    );
  }
}