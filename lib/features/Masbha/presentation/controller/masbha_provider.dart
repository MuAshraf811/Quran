import 'package:flutter/foundation.dart';
import 'package:quran/core/cache_helper.dart';

class MasbhaProvider with ChangeNotifier {
  int count1 = CacheHelper.getIntValue('sebha1')?? 0;
  int count2 = CacheHelper.getIntValue('sebha2')?? 0;
  int count3 = CacheHelper.getIntValue('sebha3')?? 0;

  void countNumber(int index) {
    switch (index) {
      case 1:
        {
          count1++;
          notifyListeners();
        }

        break;
      case 2:
        {
          count2++;
          notifyListeners();
        }
        break;

      case 3:
        {
          count3++;
          notifyListeners();
        }
      default:
        {
          count1++;
          notifyListeners();
        }
    }
  }

  void reset() {
    count1 = 0;
    count2 = 0;
    count3 = 0;
    notifyListeners();
  }
}
