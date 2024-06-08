import 'package:firebase_app/src/features/authentication/models/user_model.dart';
import 'package:firebase_app/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:firebase_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:firebase_app/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {

  static SignUpController get instance => Get.find();

  // Textfield Controller to get data  from textField 
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

  //Call this Function from Design & it will do the logic
  void registerUser(String email, String password) async{
    String? error = await AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
    if(error != null){
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  // Get phoneNo from user and pass it to auth repository for firebase authentication
  void phoneAuthentication(String phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
    
  }
  Future<void> createUser(UserModel user) async {
   await  userRepo.createUser(user);
   //phoneAuthentication(user.phoneNo);
    //Get.to(() => const OTPScreen());
  }
  
}