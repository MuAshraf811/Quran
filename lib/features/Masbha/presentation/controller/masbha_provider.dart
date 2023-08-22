import 'package:flutter/foundation.dart';

class MasbhaProvider with ChangeNotifier {
  int count = 0;

  void countNumber() {
    count++;
    notifyListeners();
  }

  void reset() {
    count = 0;
    notifyListeners();
  }
}
