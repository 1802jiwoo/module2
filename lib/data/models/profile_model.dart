import 'dart:ui';

class ProfileModel {

  final String profileName;
  final Color profileColor;

  ProfileModel({required this.profileName, required this.profileColor});

  factory ProfileModel.createProfile(String profileName, Color profileColor) {
    return ProfileModel(profileName: profileName, profileColor: profileColor);
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      profileName: json['profileName'],
      profileColor: Color.fromRGBO(
        json['r'],
        json['g'],
        json['b'],
        1,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profileName': profileName,
      'r': profileColor.red,
      'g': profileColor.green,
      'b': profileColor.blue,
    };
  }

}