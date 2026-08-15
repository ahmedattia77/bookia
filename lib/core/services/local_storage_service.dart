import 'package:bookia/core/constants/keys/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveTheme(bool isDark) async {
    await _preferences.setBool(Keys.themeKey, isDark);
  }

  static bool getSavedTheme() {
    return _preferences.getBool(Keys.themeKey) ?? false;
  }

  static Future<void> saveLanguage(String langCode) async {
    await _preferences.setString(Keys.langKey, langCode);
  }

  static Future<void> saveUserToken({required String userToken}) async {
    await _preferences.setString(Keys.userTokenKey, userToken);
  }

  static String getSavedLanguage() {
    return _preferences.getString(Keys.langKey) ?? 'en';
  }

  static String getSavedUserToken() {
    return _preferences.getString(Keys.userTokenKey) ?? '';
  }

  static bool isUserLoggedIn() {
    final token = getSavedUserToken();
    return token.isNotEmpty;
  }
}
