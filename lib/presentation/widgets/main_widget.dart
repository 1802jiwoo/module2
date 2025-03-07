import 'package:flutter/material.dart';
import 'package:ott102/presentation/providers/main_provider.dart';
import 'package:ott102/presentation/screens/main_screens/comming_soon_screen.dart';
import 'package:ott102/presentation/screens/main_screens/download_screen.dart';
import 'package:ott102/presentation/screens/main_screens/home_screen.dart';
import 'package:ott102/presentation/screens/main_screens/profile_screen.dart';
import 'package:ott102/presentation/screens/main_screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mainProvider.addListener(updateScreen);
    },);
  }

  @override
  void dispose() {
    mainProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: mainProvider.pageController,
          children: [
            HomeScreen(),
            CommingSoonScreen(),
            DownloadScreen(),
            SearchScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF232935),
          selectedItemColor: Color(0xFFF77A04),
          unselectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(
            color: Color(0xFFF77A04),
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
          currentIndex: mainProvider.currentIndex,
          onTap: (index) => {
            mainProvider.moveScreen(index),
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined, size: 24,), label: 'HOME'),
            BottomNavigationBarItem(icon: Icon(Icons.playlist_play, size: 24,), label: '공개예정'),
            BottomNavigationBarItem(icon: Icon(Icons.download_outlined, size: 24,), label: '다운로드'),
            BottomNavigationBarItem(icon: Icon(Icons.search_outlined, size: 24,), label: '검색'),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle, size: 24,), label: '프로필'),
          ],
        ),
      ),
    );
  }
}
