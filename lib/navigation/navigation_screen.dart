import 'package:flutter/material.dart';
import 'package:netflix_app/main_screen/netflix_home.dart';
import 'package:netflix_app/main_screen/search_screen.dart';
import 'package:netflix_app/screens/detail_screen.dart';
import 'package:netflix_app/screens/whos_watching.dart';

class Navigationscreen extends StatefulWidget {
  const Navigationscreen({super.key});

  @override
  State<Navigationscreen> createState() => _NavigationscreenState();
}

class _NavigationscreenState extends State<Navigationscreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    NetflixHome(),
    DetailScreen(),
    SearchScreen(),
    WhosWatching(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: _currentIndex,

        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: "New & Hot",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),

          BottomNavigationBarItem(
            icon: Icon(Icons.download_for_offline_outlined),
            label: "Downloads",
          ),
        ],
      ),
    );
  }
}
