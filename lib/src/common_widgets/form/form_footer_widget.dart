import 'package:firebase_app/src/constants/image_string.dart';
import 'package:firebase_app/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:firebase_app/src/features/authentication/screens/login/login_screen.dart';

class FormFooterWidget extends StatelessWidget {
  const FormFooterWidget({
    super.key,
    required this.image,
    required this.textIcon,
    required this.text,
    required this.page
  });

  final String image, textIcon, text, page;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('OR'),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Image(
                  image: AssetImage(tIconGoogle), height: 20, width: 20),
              label: const Text(tSignInWithGoogle)),
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed('$page');
          },
          child: Text.rich(
            TextSpan(
                text: tAlreadyHaveAnAccount,
                style: Theme.of(context).textTheme.bodyText1,
                children: const [
                  TextSpan(
                    text: tSignup,
                    style: TextStyle(color: Colors.blue),
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
