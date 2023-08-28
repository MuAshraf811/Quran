import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedInstance;

  static createInstance() async {
    sharedInstance = await SharedPreferences.getInstance();
  }

  static saveIntValue(String key, int value) async {
    await sharedInstance?.setInt(key, value);
  }

  static saveBoolValue(String key, bool value) async {
    await sharedInstance?.setBool(key, value);
    
  }

  static getIntValue(String key) {
    return sharedInstance?.getInt(key);
  }

  static getBoolValue(String key) {
    return sharedInstance?.getBool(key);
  }
}
