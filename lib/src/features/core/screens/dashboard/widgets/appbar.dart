import 'package:firebase_app/src/constants/colors.dart';
import 'package:firebase_app/src/constants/image_string.dart';
import 'package:firebase_app/src/constants/text_strings.dart';
import 'package:firebase_app/src/features/core/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashBoardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(
        Icons.menu,
        color: Colors.black,
      ),
      title: Text(
        tAppName,
        style: Theme.of(context).textTheme.headline4,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20, top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: tCardBgColor,
          ),
          child: IconButton(
            onPressed: () {
              //AuthenticationRepository.instance.logout();
              Get.to(() => const ProfileScreen());
            },
            icon: SizedBox(
              width: 40,
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const Image(
                  image: AssetImage(tDashboardUserProfile),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
