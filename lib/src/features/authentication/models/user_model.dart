/*
    =====
    to do : step 1 [Create Model]
    =====
*/

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;

  const UserModel(
      {this.id,
      required this.fullName,
      required this.email,
      required this.phoneNo,
      required this.password});

  toJson() {
    return {
      "FullName": fullName,
      "Emaill": email,
      "Phone": phoneNo,
      "Password": password,
    };
  }

  // Step 1 - Map User fetched from Firebase to Usermodel
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        email: data["Emaill"],
        fullName: data["FullName"],
        password: data["Password"],
        phoneNo: data["Phone"]);
  }
}
