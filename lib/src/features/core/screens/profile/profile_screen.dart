import 'package:firebase_app/src/constants/colors.dart';
import 'package:firebase_app/src/constants/image_string.dart';
import 'package:firebase_app/src/constants/sizes.dart';
import 'package:firebase_app/src/constants/text_strings.dart';
import 'package:firebase_app/src/features/core/screens/profile/update_profile_screen.dart';
import 'package:firebase_app/src/features/core/screens/profile/user_management_profile.dart';
import 'package:firebase_app/src/features/core/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: isDark ? Colors.black : Colors.white,
        leading: IconButton(
          color: isDark ? Colors.white : Colors.black,
          onPressed: () {
            Get.back();
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          tProfile,
          style: Theme.of(context).textTheme.headline4,
        ),
        actions: [
          IconButton(
              color: isDark ? Colors.white : Colors.black,
              onPressed: () {},
              icon:
                  Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaulSize),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        tDashboardUserProfile,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: tPrimaryColor),
                      child: const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                tProfileHeading,
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                tProfileSubHeading,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const UpdateProfileScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      tEditProfile,
                      style: TextStyle(color: tDarkColor),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              // -- Divider() la 1 widget được sử dụng để tạo ra một đường kẻ ngang hoặc dọc để phân chia các phần của giao diện người dùng.
              const Divider(),
              const SizedBox(
                height: 10,
              ),

              //Menu
              ProfileMenuWidget(
                  title: tMenu1, icon: LineAwesomeIcons.cog, onPress: () {}),
              ProfileMenuWidget(
                  title: tMenu2, icon: LineAwesomeIcons.wallet, onPress: () {}),
              ProfileMenuWidget(
                  title: tMenu3,
                  icon: LineAwesomeIcons.user_check,
                  onPress: () {
                    Get.to(() => const UserManagementProfile());
                  }),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                  title: tMenu4, icon: LineAwesomeIcons.info, onPress: () {}),
              ProfileMenuWidget(
                title: tMenu5,
                textColor: Colors.red,
                endIcon: false,
                icon: LineAwesomeIcons.alternate_sign_out,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
