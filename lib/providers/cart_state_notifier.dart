import 'package:ecommerce_ui/models/cart_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartStateNotifier extends StateNotifier<List<CartModel>> {
  CartStateNotifier() : super([]);

  void addProductToCart(CartModel cartModel) {
    final existingProductIndex = state.indexWhere(
      (element) => element.productId == cartModel.productId,
    );

    if (existingProductIndex >= 0) {
      state = state.where((element) => element.id != cartModel.id).toList();
    } else {
      state = [...state, cartModel];
    }
  }

  void removeProductFromCart(CartModel cartModel) {
    state = state.where((element) => element.id != cartModel.id).toList();
  }

  void clearCart() {
    state = [];
  }
}

final StateNotifierProvider<CartStateNotifier, List<CartModel>>
    cartStateNotifierProvider =
    StateNotifierProvider<CartStateNotifier, List<CartModel>>(
  (ref) => CartStateNotifier(),
);
