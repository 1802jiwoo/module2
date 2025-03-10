import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:ott102/data/models/profile_model.dart';
import 'package:ott102/domain/use_cases/profile_use_case.dart';

class CreateProfileProvider extends ChangeNotifier {

  final ProfileUseCase profileUseCase;
  CreateProfileProvider(this.profileUseCase);

  String profileName = '기본';
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

  Future<void> saveProfileList() async {
    final newProfile = ProfileModel.createProfile(profileName, profileColor);
    profileUseCase.saveProfileList(newProfile);
    // notifyListeners();
    // Navigator.of(context).pop();
  }



}