import 'package:device_preview/device_preview.dart';
import 'package:firebase_app/firebase_options.dart';
import 'package:firebase_app/src/features/authentication/screens/forget_password/forget_password_mails/forget_password_mail.dart';
import 'package:firebase_app/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:firebase_app/src/features/authentication/screens/login/login_screen.dart';
import 'package:firebase_app/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:firebase_app/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:firebase_app/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:firebase_app/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:firebase_app/src/features/core/screens/dashboard/dashboard.dart';
import 'package:firebase_app/src/features/core/screens/profile/profile_screen.dart';
import 'package:firebase_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:firebase_app/src/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Qmanh',
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: const SplashScreen(),
      routes: {
        '$OnBoardingScreen': (_) => OnBoardingScreen(),
        '$LoginSceen': (_) => const LoginSceen(),
        '$SignUpSceen': (_) => const SignUpSceen(),
        '$ForgetPasswordMailScreen': (_) => const ForgetPasswordMailScreen(),
        '$OTPScreen': (_) => const OTPScreen(),
        '$Dashboard': (_) => const Dashboard(),
        '$ProfileScreen': (_) => const ProfileScreen(),
      },
    );
  }
}
