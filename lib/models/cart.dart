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
    final index = state.indexOf(product);

    if (index != -1) {
      final newState = [...state];
      newState.removeAt(index);
      state = newState;
    }
  }

  String get priceInEuros =>
      "${(state.fold<num>(0, (prv, actual) => prv + actual.price)).toStringAsFixed(2)}€";
}
