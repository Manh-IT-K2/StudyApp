import 'package:firebase_app/src/features/authentication/models/user_model.dart';
import 'package:firebase_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:firebase_app/src/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  /// Step 3 - Get User Email  and Pass to Userepository to fetch user record.
  /// Nhận email người dùng và chuyển đến kho lưu trữ người dùng để tìm nạp hồ sơ người dùng.
  getUserData(){
    final email = _authRepo.firebaseUser.value?.email;
    if(email != null){
      return _userRepo.getUserDetail(email);

    }else{
      Get.snackbar("Error", "Login to continue");
    }
  }
  Future<List<UserModel>> getAllUser() async {
    return await _userRepo.allUser();
  }
}