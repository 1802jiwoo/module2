import 'package:flutter/cupertino.dart';
import 'package:ott102/data/models/profile_model.dart';
import 'package:ott102/domain/use_cases/profile_use_case.dart';
import 'package:ott102/main.dart';


SelectProfileProvider selectProfileProvider = SelectProfileProvider(ProfileUseCase(sharedPrefRepository));

class SelectProfileProvider extends ChangeNotifier {
  
  final ProfileUseCase profileUseCase;

  SelectProfileProvider(this.profileUseCase);

  List<ProfileModel> profileList = [];
  
  loadProfileList() {
    profileList = profileUseCase.getProfileList();
    notifyListeners();
  }

}