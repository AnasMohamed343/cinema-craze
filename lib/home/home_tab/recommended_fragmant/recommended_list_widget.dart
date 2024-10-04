import 'package:cinema_craze/home/home_tab/recommended_fragmant/recommended_list_view.dart';
import 'package:cinema_craze/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      color: const Color(0xff282A28),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 6, bottom: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recommended',
              style: TextStyle(
                color: ColorsManager.whiteColor,
                fontSize: 23,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            RecommendedListView(),
          ],
        ),
      ),
    );
  }
}
