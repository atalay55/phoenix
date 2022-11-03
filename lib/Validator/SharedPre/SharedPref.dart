import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{

  SharedPref(){ initialize();
  remeberMe(false);
  }
  SharedPreferences _prefs;

  initialize() async {
    if (_prefs != null) {
      return _prefs;
    } else {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  Future<void> saveMail(String userName) async {
    return await _prefs.setString('mail', userName);
  }
   Future<void> sharedClear() async {
    return _prefs.clear();
  }
   Future<void> remeberMe(bool beniHatirla) async {
    return  await _prefs.setBool('rememberMe', beniHatirla ?? false);
  }
  Future<bool> getRememberMe() async {
    bool boolValue = _prefs.getBool('rememberMe');
    return boolValue;
  }
}






