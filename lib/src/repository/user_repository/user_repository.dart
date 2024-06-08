
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


/*
    =====
    to do : step 2 [User Repository to Perform Datatbase Operations]
    =====
*/


class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "You account has been created.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Somethings went wrong. Try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print("ERROR - $error");
    });
  }

  // step 2 - Fetch All User or User Details
  Future<UserModel> getUserDetail(String email) async {
    final snapshot = await _db.collection("Users").where("Emaill",isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }


Future<bool> checkUsernameAndPassword(String username, String password) async {
  // Lấy tất cả các documents có trường "username" bằng với giá trị đã nhập vào từ người dùng
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('Users')
      .where('FullName', isEqualTo: username)
      .get();
      
  // Kiểm tra xem có bất kỳ document nào thỏa mãn điều kiện trên hay không
  if (querySnapshot.size == 0) {   
    return false; // Không tìm thấy tài khoản với username đã nhập vào
  }

  // Kiểm tra xem password có trùng khớp với password được lưu trong Firestore không
  String savedPassword = querySnapshot.docs[0]['Password'];
  return savedPassword == password;
}

}
