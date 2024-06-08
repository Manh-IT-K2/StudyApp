import 'package:firebase_app/src/repository/authentication_repository/exception/signup_email_password_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Varibales
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  // will be load when app launches this func will be colled and set the firebaseUser state
  @override
  void onReady(){
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }
  // setting initial screen onLoad
  _setInitialScreen(User? user){
    //user == null? Get.offAll(() => const Welcome()): Get.to(() => const Dashboard());
  }

  // func
  Future<void> phoneAuthentication(String phoneNo) async{
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async{
        await _auth.signInWithCredential(credential);
      }, 
     
      codeSent: (verificationId, forceResendingToken) {
        this.verificationId.value = verificationId;
      }, 
      codeAutoRetrievalTimeout: (verificationId){
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e){
        if(e.code == 'invalid-phone-number'){
          Get.snackbar('Error', 'The provided phone number is not valid.'); 
        }else{
          Get.snackbar('Error', 'Something went wrong. Try again');
        }
      }, 
    );
  }

  Future<bool> verifyOTP(String otp) async{
    var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async{
   try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
     // firebaseUser.value != null ? Get.offAll(() => const Dashboard()) : Get.to(() => const Welcome());
   } on FirebaseAuthException catch(e){
    final ex = SignUpWhithEmailAndPasswordFailure.code(e.code);
    print('FIREBASE AUTH EXCEPTION - ${ex.message}');
   }
   catch (_) { 
    const ex = SignUpWhithEmailAndPasswordFailure();
    print('EXCEPTION - ${ex.message}');
   }
  }

  Future<void> loginUserWithEmailAndPassword(String email, String password) async{
   try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
   } on FirebaseAuthException catch(e){

   }
   catch (_) { 
   }
  }

  Future<void> logout() async => await _auth.signOut();

}