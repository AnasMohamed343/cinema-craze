import 'package:cinema_craze/utils/assets_manager.dart';
import 'package:cinema_craze/utils/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  //Splash(splash);
  // const Splash(param0, { Key key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(RoutesManager.homeScreenRoute);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1E1E1E),
      alignment: Alignment.center,
      child: Container(
        height: 175.h,
        width: 160.w,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            alignment: Alignment.center,
            fit: BoxFit.contain,
            image: AssetImage(AssetsManager.appLogo),
          ),
        ),
      ),
    );
  }
}
