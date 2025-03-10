import 'package:flutter/material.dart';
import 'package:ott102/presentation/providers/main_provider.dart';
import 'package:ott102/presentation/screens/main_screens/comming_soon_screen.dart';
import 'package:ott102/presentation/screens/main_screens/download_screen.dart';
import 'package:ott102/presentation/screens/main_screens/home_screen.dart';
import 'package:ott102/presentation/screens/main_screens/profile_screen.dart';
import 'package:ott102/presentation/screens/main_screens/search_screen.dart';

class MainWidget extends StatefulWidget {
  final Color profileColor;
  final String profileName;
  final int selectProfileIndex;

  const MainWidget({
    super.key,
    required this.profileColor,
    required this.profileName,
    required this.selectProfileIndex
  });

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {

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
            ProfileScreen(selectProfileIndex: widget.selectProfileIndex,),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
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
            BottomNavigationBarItem(
                icon: Container(
                  alignment: Alignment.center,
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 0.5),
                      color: widget.profileColor
                  ),
                  child: Text(widget.profileName[0], style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),),
                ), label: '프로필'),
          ],
        ),
      ),
    );
  }
}
