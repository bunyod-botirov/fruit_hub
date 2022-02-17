import 'package:flutter/material.dart';
import 'package:fruit_hub/database/database.dart';

class ProductProvider extends ChangeNotifier {
  int count = 1;

  void addCount(Map product) {
    count += 1;
    product["count"] = count;
    notifyListeners();
  }

  void removeCount(Map product) {
    if (count > 1) {
      count -= 1;
      product["count"] = count;
    }
    notifyListeners();
  }

  void addToBasket(Map product) {
    orders.add(product);
  }
}
