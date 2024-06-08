import 'package:firebase_app/src/constants/sizes.dart';
import 'package:firebase_app/src/constants/text_strings.dart';
import 'package:firebase_app/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:firebase_app/src/features/core/screens/dashboard/widgets/banners.dart';
import 'package:firebase_app/src/features/core/screens/dashboard/widgets/categories.dart';
import 'package:firebase_app/src/features/core/screens/dashboard/widgets/search.dart';
import 'package:firebase_app/src/features/core/screens/dashboard/widgets/top_cources.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final tTexttheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const DashBoardAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaulSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -- Heading
              Text(
                tDashboardTitle,
                style: tTexttheme.bodyText2,
              ),
              Text(
                tDashboardHeading,
                style: tTexttheme.headline2,
              ),
              const SizedBox(
                height: tDefaulSize,
              ),

              // -- Search box
              DashBoardSearch(tTexttheme: tTexttheme),
              const SizedBox(
                height: 20,
              ),

              // -- Categories
              DashBoardCategories(tTexttheme: tTexttheme),
              const SizedBox(
                height: 20.0,
              ),

              // -- Banners
              DashBoardBanners(tTexttheme: tTexttheme),
              const SizedBox(
                height: 25.0,
              ),

              // -- top courses
              Text(
                tDashboardTopCources,
                style: tTexttheme.headline4?.apply(fontSizeFactor: 1.2),
              ),
              DashBoardTopCources(tTexttheme: tTexttheme),
            ],
          ),
        ),
      ),
    );
  }
}

