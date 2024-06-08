import 'package:firebase_app/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class DashBoardSearch extends StatelessWidget {
  const DashBoardSearch({
    super.key,
    required this.tTexttheme,
  });

  final TextTheme tTexttheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
        border: Border(left: BorderSide(width: 4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tDashboardSearch,
            style: tTexttheme.headline2?.apply(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          const Icon(Icons.mic),
        ],
      ),
    );
  }
}