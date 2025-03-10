import 'package:flutter/material.dart';
import 'package:ott102/data/repositories/shared_pref_repository.dart';
import 'package:ott102/presentation/screens/lunch_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPrefRepository sharedPrefRepository;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefRepository = SharedPrefRepository(await SharedPreferences.getInstance());
  runApp(MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: Color(0xFF080E1D),
    ),
    home: LunchScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
