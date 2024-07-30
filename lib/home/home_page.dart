import 'package:cinema_craze/home/browse_tab_widget/browse_tab_widget.dart';
import 'package:cinema_craze/home/home_tab/home_tab_widget.dart';
import 'package:cinema_craze/home/search_tab_widget/search_tab_widget.dart';
import 'package:cinema_craze/home/watchlist_tab_widget/watchlist_tab_widget.dart';
import 'package:flutter/material.dart';

import '../data/apis/models/popular_response/popular.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'Home-Page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeTabWidget(),
    SearchTabWidget(),
    BrowseTabWidget(),
    WatchlistTabWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xffFFB224),
        unselectedItemColor: Color(0xffC6C6C6),
        showUnselectedLabels: true,
        selectedIconTheme: IconThemeData(size: 33),
        iconSize: 30,
        backgroundColor: Color(0xff1A1A1A),
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color(0xff1A1A1A),
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xff1A1A1A),
            icon: Icon(Icons.search),
            label: 'SEARCH',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xff1A1A1A),
            icon: Icon(Icons.movie),
            label: 'BROWSE',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xff1A1A1A),
            icon: Icon(Icons.collections_bookmark_rounded),
            label: 'WATCHLIST',
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
