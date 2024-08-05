import 'package:cinema_craze/di/di.dart';
import 'package:cinema_craze/home/browse_tab_widget/specific_genres/specific_genres_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home/home_page.dart';
import 'splash/splash_screen.dart';
import 'utils/routes_manager.dart';

void main() {
  configureDependencies();
  //await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 867),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          // title: 'Flutter Demo',
          // theme: ThemeData(
          //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //   useMaterial3: true,
          // ),
          debugShowCheckedModeBanner: false,
          home: HomePage(),
          routes: {
            RoutesManager.homeScreenRoute: (_) => HomePage(),
            RoutesManager.splashScreenRoute: (_) => SplashScreen(),
            RoutesManager.specificGenreListScreen: (_) =>
                SpecificGenreListWidget(),
          },
          initialRoute: RoutesManager.splashScreenRoute,
        ));
  }
}
