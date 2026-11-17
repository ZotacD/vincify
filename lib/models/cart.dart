import 'package:flutter/foundation.dart';
import 'package:vincify/models/product.dart';

class Cart extends ChangeNotifier {
  final List<Product> _products = [];
  List<Product> get products => _products;

  void add(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    _products.remove(product);
    notifyListeners();
  }

  bool contains(Product product) {
    return this._products.contains(product);
  }
}
