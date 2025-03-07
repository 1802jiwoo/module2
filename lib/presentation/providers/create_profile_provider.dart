import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:ott102/data/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateProfileProvider extends ChangeNotifier {

  String profileName = '기본';
  String profileListKey = 'profile_list_key';
  Color profileColor = Color.fromRGBO(
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
    1,
  );

  String get getFirstProfileName => profileName.isNotEmpty ? profileName[0] : '';

  void changeProfileName(String newName) {
    profileName = newName;
    notifyListeners();
  }

  // Future<void> saveProfile() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   final profileLists = pref.getStringList(profileListKey);
  //
  //   final newProfileList = ProfileModel.createProfile(profileName, profileColor).toJson();
  //
  //   profileLists!.add(jsonEncode(newProfileList));
  //
  //   pref.setStringList(profileListKey, profileLists);
  //
  // }
  //
  // // Future<ProfileModel?>
  // Future<void> getProfileList() async {
  //   print('a1');
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   print('a2');
  //   final profileListData = pref.getStringList(profileListKey) ?? [];
  //   print('a3');
  //   profileListData.map((e) {
  //     print('a4');
  //     print(ProfileModel.fromJson(jsonDecode(e)));
  //     print('a5');
  //     // return ProfileModel.fromJson(jsonDecode(e));
  //   },).toList();
  // }

}