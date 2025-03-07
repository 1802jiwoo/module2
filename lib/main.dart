import 'package:flutter/material.dart';
import 'package:ott102/presentation/screens/lunch_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF232935),
      ),
      scaffoldBackgroundColor: Color(0xFF080E1D),
    ),
    home: LunchScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
