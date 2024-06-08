import 'package:firebase_app/src/constants/text_strings.dart';
import 'package:firebase_app/src/features/authentication/controllers/login_controller.dart';
import 'package:firebase_app/src/features/authentication/screens/forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';
import 'package:firebase_app/src/features/core/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
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
                prefixIcon: Icon(
                  Icons.person_outline_outlined,
                ),
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.fingerprint,
                ),
                labelText: 'Password',
                suffixIcon: Icon(
                  Icons.remove_red_eye_sharp,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    FogetPasswordScreen.BuildShowmodalBottomSheet(context);
                  },
                  child: const Text(tForgetPassword)),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    String username = controller.fullName.text;
                    String password = controller.password.text;

                    bool isValid = await LoginController.instance
                        .logIn(username, password);
                    if (isValid) {
                      final snackBar = SnackBar(
                        content:  Container(
                          height: 80,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                'Success !',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                'Logged in successfully !',
                                style: TextStyle(
                                    color: Colors.white,                                    
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 2),
                      );
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushNamed('$Dashboard');
                    } else {
                      //Hiển thị thông báo nếu username hoặc password nhập vào không chính xác
                      final snackBar = SnackBar(
                        content:  Container(
                          height: 80,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                'Error !',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                'Incorrect username or password !',
                                style: TextStyle(
                                    color: Colors.white,                                    
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 2),
                      );
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
                child: Text(
                  tLogin.toUpperCase(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
