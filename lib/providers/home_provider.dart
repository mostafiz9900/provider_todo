import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  int count = 0;
  increment() {
    count++;
    notifyListeners();
    print(count);
  }
}
