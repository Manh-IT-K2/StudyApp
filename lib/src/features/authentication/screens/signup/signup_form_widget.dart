import 'package:firebase_app/src/constants/text_strings.dart';
import 'package:firebase_app/src/features/authentication/controllers/signup_controller.dart';
import 'package:firebase_app/src/features/authentication/models/user_model.dart';
import 'package:firebase_app/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:firebase_app/src/features/core/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: tFullName,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: tEmail,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: tPhoneNo,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: tPassword,
                suffixIcon: Icon(Icons.remove_red_eye_sharp),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: TextButton(onPressed: () {

            //   }, child: Text(tForgetPassword)),
            // ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // SignUpController.instance.registerUser(
                    //   controller.email.text.trim(),
                    //    controller.password.text.trim(),
                    //    );
                    //SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());
                    // Get.to(() => const OTPScreen());
                    /*
                      ======
                      todo: Step 3 [Get User and Pass it to controller]
                      ======
                      */
                    final user = UserModel(
                      email: controller.email.text.trim(),
                  
                      fullName: controller.fullName.text.trim(),
                       password: controller.password.text.trim(),
                      phoneNo: controller.phoneNo.text.trim(),
                    );
                    SignUpController.instance.createUser(user);
                    Get.to(() => const Dashboard());
                  }
                },
                child: Text(
                  tSignup.toUpperCase(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
