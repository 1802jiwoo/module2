import 'dart:convert';

import 'package:ott102/data/models/profile_model.dart';
import 'package:ott102/data/repositories/shared_pref_repository.dart';

class ProfileUseCase {

  final SharedPrefRepository sharedPrefRepository;

  ProfileUseCase(this.sharedPrefRepository);
  String profileListKey = 'PROFILE_LIST_KEY';

  void saveProfileList(ProfileModel newProfile) async {
    final allProfileList = await sharedPrefRepository.getProfileStringList(profileListKey);
    allProfileList.add(jsonEncode(newProfile.toJson()));
    sharedPrefRepository.saveProfileList(profileListKey, allProfileList);
  }
  
  List<ProfileModel> getProfileList() {
    return sharedPrefRepository.getProfileStringList(profileListKey).map((e) {
      return ProfileModel.fromJson(jsonDecode(e));
    },).toList();
  }

}