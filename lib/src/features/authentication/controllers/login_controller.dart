import 'package:firebase_app/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  /* 
  LoginController là một lớp đối tượng (class) trong ứng dụng của chúng ta.
  get instance là tên của getter, nó cho phép lấy giá trị của một biến private và không cần định nghĩa một hàm getter.
  => là toán tử trả về kết quả của getter.
  Get.find() là hàm được sử dụng để truy xuất một instance của lớp được đăng ký với GetX. Trong trường hợp này, chúng ta đang truy xuất instance của LoginController thông qua hàm find().
  */
  static LoginController get instance => Get.find();

  final fullName = TextEditingController();
  final password = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<bool> logIn(String fullname, String password) async => await UserRepository.instance.checkUsernameAndPassword(fullname, password);
  
}