import 'package:ecommerce_ui/data/products.dart';
import 'package:ecommerce_ui/models/cart_model.dart';
import 'package:ecommerce_ui/service/cart_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartStateNotifier extends StateNotifier<List<Product>> {
  CartStateNotifier() : super([]);

  // final CartService cartService = CartService();

  // final List<CartModel> cart = [];

  void addToCart(Product product) {
    state = [...state, product];
  }

  void removeProduct(CartModel product) {
    state = state.where((element) => element.id != product.id).toList();
  }

  void clearCart() {
    state = [];
  }
}

final StateNotifierProvider<CartStateNotifier, List<Product>>
    cartStateNotifierProvider =
    StateNotifierProvider<CartStateNotifier, List<Product>>(
  (ref) => CartStateNotifier(),
);
