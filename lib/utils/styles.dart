import 'package:cinema_craze/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle displaySmall = GoogleFonts.poppins(
    fontSize: 10.sp,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );
  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white.withOpacity(.67),
  );
  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static TextStyle titleAppBar = GoogleFonts.inter(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static TextStyle dateSmall = GoogleFonts.inter(
    fontSize: 10.sp,
    color: ColorsManager.movieDateColor,
    fontWeight: FontWeight.w400,
  );
  static TextStyle genreText = GoogleFonts.inter(
    fontSize: 10.sp,
    color: ColorsManager.genreTextColor,
    fontWeight: FontWeight.w400,
  );
  static TextStyle averageRate = GoogleFonts.poppins(
    fontSize: 18.sp,
    color: ColorsManager.whiteColor,
    fontWeight: FontWeight.w400,
  );
  static TextStyle dateText = GoogleFonts.inter(
    fontSize: 8.sp,
    color: ColorsManager.movieDateColor,
    fontWeight: FontWeight.w400,
  );
}
