import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefRepository {

  final SharedPreferences sharedPreferences;

  SharedPrefRepository(this.sharedPreferences);

  void saveProfileList(String key, List<String> value) {
    sharedPreferences.setStringList(key, value);
  }

  List<String> getProfileStringList(String key) {
    return sharedPreferences.getStringList(key) ?? [];
  }

}