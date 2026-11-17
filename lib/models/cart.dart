import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vincify/models/product.dart';
part 'cart.g.dart';

@riverpod
class Cart extends _$Cart {
  @override
  List<Product> build() {
    return [];
  }

  void add(Product product) {
    state = [...state, product];
  }

  void remove(Product product) {
    state = state.where((p) => p != product).toList();
  }
}
