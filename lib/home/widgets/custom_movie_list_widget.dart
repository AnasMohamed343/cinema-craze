import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMovieListWidget extends StatelessWidget {
  double height;
  String data;
  Widget widget;
  CustomMovieListWidget(
      {required this.height, required this.data, required this.widget});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Color(0xff282A28),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 8, bottom: 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            widget,
          ],
        ),
      ),
    );
  }
}
