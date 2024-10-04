import 'package:cinema_craze/home/browse_tab_widget/browse_tab_widget.dart';
import 'package:cinema_craze/home/browse_tab_widget/genres_movie_list.dart';
import 'package:cinema_craze/home/home_tab/home_tab_widget.dart';
import 'package:cinema_craze/home/search_tab_widget/search_tab_widget.dart';
import 'package:cinema_craze/home/watchlist_tab_widget/watchlist_tab_widget.dart';
import 'package:cinema_craze/utils/colors_manager.dart';
import 'package:flutter/material.dart';

import '../data/apis/models/popular_response/popular.dart';

class HomePage extends StatefulWidget {
  //static const String routeName = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  int actualIndex = 0;
  List<Widget> tabs = [
    HomeTabWidget(),
    //SearchTabWidget(),
    BrowseTabWidget(),
    WatchListTabWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgColor,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorsManager.primaryLinearColor,
        unselectedItemColor: ColorsManager.unselectedIconColor,
        showUnselectedLabels: true,
        selectedIconTheme: const IconThemeData(size: 33),
        iconSize: 30,
        backgroundColor: ColorsManager.bottomNavColor,
        currentIndex: actualIndex,
        onTap: (index) {
          if (index == 1) {
            showSearch(context: context, delegate: SearchTabWidget());
          } else {
            setState(() {
              //selectedIndex = index;
              actualIndex = index;
              selectedIndex = index > 1 ? index - 1 : index;
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: ColorsManager.bottomNavColor,
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            backgroundColor: ColorsManager.bottomNavColor,
            icon: Icon(Icons.search),
            label: 'SEARCH',
          ),
          BottomNavigationBarItem(
            backgroundColor: ColorsManager.bottomNavColor,
            icon: Icon(Icons.movie),
            label: 'BROWSE',
          ),
          BottomNavigationBarItem(
            backgroundColor: ColorsManager.bottomNavColor,
            icon: Icon(Icons.collections_bookmark_rounded),
            label: 'WATCHLIST',
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
