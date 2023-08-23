import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
 static SharedPreferences? sharedInstance;

 static createInstance() async {
    sharedInstance = await SharedPreferences.getInstance();
  }

 static saveIntValue(String key , int value) async {
    sharedInstance?.setInt(key, value);
  }


  static saveBoolValue(String key , int value) async {
    sharedInstance?.setInt(key, value);
  }




 static getIntValue(String key , int value) async {
    sharedInstance?.getInt(key);
  }
   
  static getBoolValue(String key , int value) async {
    sharedInstance?.getBool(key);
  }
}
