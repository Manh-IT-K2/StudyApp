import 'package:firebase_app/src/constants/colors.dart';
import 'package:firebase_app/src/features/core/models/dashboard/categories_model.dart';
import 'package:flutter/material.dart';

class DashBoardCategories extends StatelessWidget {
  const DashBoardCategories({
    super.key,
    required this.tTexttheme,
  });

  final TextTheme tTexttheme;

  @override
  Widget build(BuildContext context) {
    final list = DashBoardCategoriesModel.list;
    return SizedBox(
      
      height: 45,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => GestureDetector(
          onTap: list[index].onPress,
          child: SizedBox(
              width: 170,
              height: 45,
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: tDarkColor,
                    ),
                    child: Center(
                      child: Text(
                        list[index].title,
                        style: tTexttheme.headline6
                            ?.apply(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          list[index].heading,
                          style: tTexttheme.headline6,
                          overflow: TextOverflow.ellipsis,
                        ), // chữ vướt quá độ dài của thằng cha thì hiện ...
                        Text(
                          list[index].subHeading,
                          style: tTexttheme.bodyText2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}