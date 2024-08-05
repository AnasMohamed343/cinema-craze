import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenresItemWidget extends StatelessWidget {
  String data;
  GenresItemWidget({required this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 11),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      height: 35.h,
      width: 68.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.transparent,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Text(
        data,
        style: TextStyle(
            color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
      ),
    );
  }
}
