import 'package:ecommerce_ui/models/cart_model.dart';
import 'package:ecommerce_ui/models/category_model.dart';
import 'package:ecommerce_ui/models/favorite_model.dart';
import 'package:ecommerce_ui/models/products_model.dart';
import 'package:ecommerce_ui/models/user_model.dart';
import 'package:ecommerce_ui/service/cart_service.dart';
import 'package:ecommerce_ui/service/category_service.dart';
import 'package:ecommerce_ui/service/favorite_service.dart';
import 'package:ecommerce_ui/service/product_service.dart';
import 'package:ecommerce_ui/service/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

final FutureProvider<UserResponseModel> userNotifierProvider =
    FutureProvider<UserResponseModel>(
  (ref) async {
    GetStorage storage = GetStorage();
    final UserService userService = ref.watch(userServiceProvider);
    return userService.fetchUserData(
      storage.read('userId'),
    );
  },
);

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

final FutureProvider<FavoriteResponseModel> favoriteNotifierProvider =
    FutureProvider<FavoriteResponseModel>(
  (ref) async {
    final FavoriteService favoriteService = ref.watch(favoriteServiceProvider);
    return favoriteService.getFavoriteList();
  },
);

final FutureProvider<CategoryModel> categoryNotifierProvider =
    FutureProvider<CategoryModel>(
  (ref) async {
    final CategoryService categoryService = ref.watch(categoryServiceProvider);
    return categoryService.fetchCategories();
  },
);
