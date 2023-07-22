import 'package:ecommerce_ui/models/cart_model.dart';
import 'package:ecommerce_ui/models/products_model.dart';
import 'package:ecommerce_ui/service/cart_service.dart';
import 'package:ecommerce_ui/service/product_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final FutureProvider<ProductResponseModel> productNotifierProvider =
    FutureProvider<ProductResponseModel>(
  (ref) async {
    final ProductService productService = ref.watch(productServiceProvider);
    return productService.fetchProducts();
  },
);

final FutureProvider<CartResponseModel> cartNotifierProvider =
    FutureProvider<CartResponseModel>(
  (ref) async {
    final CartService cartService = ref.watch(cartServiceProvider);
    return cartService.getCartItems();
  },
);

// final cartLengthProvider = Provider<int>((ref) {
//   final CartResponseModel cartResponseModel = ref.watch(cartNotifierProvider);
//   return cartResponseModel.cartItems.length;
// });

// final cartLengthProvider = Provider<int>((ref) {
//   final CartResponseModel cartResponseModel = ref.watch(cartNotifierProvider);
//   return cartResponseModel.cartItems.length;
// });

// final cartTotalProvider = Provider<int>((ref) {
//   final CartResponseModel cartResponseModel = ref.watch(cartNotifierProvider);
//   int total = 0;
//   cartResponseModel.cartItems.forEach((element) {
//     total += element.totalPrice;
//   });
//   return total;
// });

// final cartItemProvider = Provider<CartItem>((ref) {
//   final CartResponseModel cartResponseModel = ref.watch(cartNotifierProvider);
//   return cartResponseModel.cartItems[0];
// });
