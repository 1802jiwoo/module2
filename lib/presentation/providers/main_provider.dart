import 'package:flutter/cupertino.dart';

MainProvider mainProvider = MainProvider();

class MainProvider extends ChangeNotifier {

  PageController pageController = PageController();
  int currentIndex = 0;

  void moveScreen(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
    notifyListeners();
  }

}