import 'package:flutter/cupertino.dart';
import 'package:ott102/data/models/profile_model.dart';
import 'package:ott102/domain/use_cases/profile_use_case.dart';
import 'package:ott102/main.dart';

ProfileProvider profileProvider = ProfileProvider(ProfileUseCase(sharedPrefRepository));

class ProfileProvider extends ChangeNotifier {
  final ProfileUseCase profileUseCase;
  ProfileProvider(this.profileUseCase);

  List<ProfileModel> profileList = [];

  void loadProfileList() {
    profileList = profileUseCase.getProfileList();
    notifyListeners();
  }

}