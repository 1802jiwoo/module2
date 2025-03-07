import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ott102/presentation/screens/select_profile_screen.dart';

LunchProvider lunchProvider = LunchProvider();

class LunchProvider extends ChangeNotifier {

  double animationType1 = -1;
  double animationType2 = 0;

  void animationStart(BuildContext context) async {
    animationType1 = 0;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1),);

    animationType2 = 1;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1),);

    Navigator.pushReplacement((context), MaterialPageRoute(builder: (_) => SelectProfileScreen()));

  }

}