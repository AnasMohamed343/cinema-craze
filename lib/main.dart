import 'package:cinema_craze/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home/home_page.dart';

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
        designSize: const Size(412, 892),
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
            HomePage.routeName: (_) => HomePage(),
          },
          initialRoute: HomePage.routeName,
        ));
  }
}
