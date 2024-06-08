import 'package:firebase_app/src/constants/colors.dart';
import 'package:firebase_app/src/constants/image_string.dart';
import 'package:firebase_app/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class DashBoardBanners extends StatelessWidget {
  const DashBoardBanners({
    super.key,
    required this.tTexttheme,
  });

  final TextTheme tTexttheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: tCardBgColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Flexible(
                      child: Icon(Icons.bookmark_rounded),
                    ),
                    Flexible(
                      child: Image(
                        image: AssetImage(tDashboardImageBanner1),
                        height: 100,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 23.0,
                ),
                Text(
                  tDashboardBannerTitle1,
                  style: tTexttheme.headline4,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  tDashboardBannerSubTitle,
                  style: tTexttheme.bodyText2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: tCardBgColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: const [
                        Flexible(
                          child: Icon(Icons.bookmark_rounded),
                        ),
                        Flexible(
                          child: Image(
                            image: AssetImage(tDashboardImageBanner2),
                            height: 100,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      tDashboardBannerTitle2,
                      style: tTexttheme.headline4,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      tDashboardBannerSubTitle,
                      style: tTexttheme.bodyText2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(tDashboardButton),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


