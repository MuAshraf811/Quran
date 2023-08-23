import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
 static SharedPreferences? sharedInstance;

 static createInstance() async {
    sharedInstance = await SharedPreferences.getInstance();
  }

 static saveIntValue(String key , int value) async {
  await  sharedInstance?.setInt(key, value);
  }


  static saveBoolValue(String key , int value) async {
   await sharedInstance?.setInt(key, value);
  }




 static getIntValue(String key )  {
    sharedInstance?.getInt(key);
  }
   
  static getBoolValue(String key  )  {
    sharedInstance?.getBool(key);
  }
}
