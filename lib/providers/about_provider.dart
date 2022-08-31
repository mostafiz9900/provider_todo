import 'package:flutter/foundation.dart';

class AboutProvider extends ChangeNotifier {
  int price = 0;
  increment() {
    price++;
    notifyListeners();
  }
}
