import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_ui/models/cart_model.dart';
import 'package:ecommerce_ui/service/endpoint.dart';
import 'package:ecommerce_ui/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class CartService {
  final GetStorage storage = GetStorage();
  final Dio dio = Dio();

  Future<CartResponseModel> getCartItems() async {
    final String token = storage.read('token');
    final int userId = storage.read('userId');

    final Response response = await dio.get(
      cartURL,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
      queryParameters: {
        'user_id': userId,
      },
    );

    debugPrint("Cart Response: ${response.data}");

    if (response.statusCode != 200) {
      final String errorMessage = response.data['message'];
      debugPrint(errorMessage);
      throw Exception(errorMessage);
    } else {
      return cartModelFromJson(json.encode(response.data));
    }
  }

  // Add To Cart Method
  Future<void> addToCart(
    int quantity,
    int productId,
    int productPrice,
  ) async {
    final String token = storage.read('token');
    final int userId = storage.read('userId');

    final Map<String, dynamic> cartData = {
      'user_id': userId,
      'product_id': productId,
      'quantity': quantity,
      'total_price': productPrice,
    };

    try {
      final Response response = await dio.post(
        cartURL,
        data: json.encode(cartData),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode != 201) {
        final String errorMessage = response.data['message'];
        debugPrint(errorMessage);
        ToastWidget(message: errorMessage);
        throw Exception(errorMessage);
      } else {
        debugPrint("Add To Cart Response: ${response.data}");
        ToastWidget(message: 'Product added to cart successfully');
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      rethrow;
    }
  }
}

final Provider<CartService> cartServiceProvider = Provider<CartService>(
  (ref) {
    return CartService();
  },
);

// final FutureProvider<CartResponseModel> cartItemsProvider =
//     FutureProvider<CartResponseModel>((ref) async {
//   final CartService cartService = ref.watch(cartServiceProvider);
//   return cartService.getCartItems();
// });
