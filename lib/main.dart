import 'package:cinema_craze/di/di.dart';
import 'package:cinema_craze/firebase_options.dart';
import 'package:cinema_craze/helper/provider/watchlist_provider.dart';
import 'package:cinema_craze/home/browse_tab_widget/specific_genres/specific_genres_list_widget.dart';
import 'package:cinema_craze/home/home_tab/popular_fragmant/popular_list_view_model.dart';
import 'package:cinema_craze/home/movie_details/similar_movies/similar_movies_vm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'home/home_page.dart';
import 'splash/splash_screen.dart';
import 'utils/routes_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  //await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    // ChangeNotifierProvider(
    //   create: (context) => WatchlistProvider(),
    //   child: MyApp(),
    // ),
    MultiProvider(
      providers: [
        // BlocProvider<PopularListVM>(
        //   create: (context) => getIt<PopularListVM>(),
        // ),
        ChangeNotifierProvider(
          create: (context) => WatchlistProvider(),
        ),
        // Provider<SimilarMoviesVM>(
        //   create: (context) => getIt<SimilarMoviesVM>(),
        // ),
      ],
      child: const MyApp(),
    ),
  );
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
                const SpecificGenreListWidget(),
          },
          initialRoute: RoutesManager.splashScreenRoute,
        ));
  }
}
