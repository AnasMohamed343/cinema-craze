import 'package:cinema_craze/data/apis/models/popular_response/popular.dart';
import 'package:cinema_craze/home/home_tab/release_fragmant/release_list_view.dart';
import 'package:cinema_craze/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReleaseListWidget extends StatelessWidget {
  // Release? released;
  // ReleaseListWidget({this.released});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 198.h,
      color: ColorsManager.moviesContainerBgColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 8, bottom: 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'New Releases',
              style: TextStyle(
                color: ColorsManager.whiteColor,
                fontSize: 23,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            ReleaseListView(),
          ],
        ),
      ),
    );
  }
}
