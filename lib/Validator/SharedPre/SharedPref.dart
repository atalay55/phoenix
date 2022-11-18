import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{

  SharedPref(){ initialize();
  remeberMe(false);
  }
  SharedPreferences? _prefs;

  initialize() async {
    if (_prefs != null) {
      return _prefs;
    } else {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  Future<bool> saveMail(String userName) async {
    return await _prefs!.setString('mail', userName);
  }
   Future<Future<bool>> sharedClear() async {
    return _prefs!.clear();
  }
   Future<bool> remeberMe(bool beniHatirla) async {
    return  await _prefs!.setBool('rememberMe', beniHatirla ?? false);
  }
  Future<bool?> getRememberMe() async {
    bool? boolValue = _prefs!.getBool('rememberMe');
    return boolValue;
  }
}






