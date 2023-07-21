import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_ui/models/cart_model.dart';
import 'package:ecommerce_ui/service/endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class CartService {
  final GetStorage storage = GetStorage();
  final Dio dio = Dio();

  Future<CartResponseModel> getCartItems() async {
    final String token = storage.read('token') as String;
    final String userId = storage.read('userId') as String;

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
}

final Provider<CartService> cartServiceProvider = Provider<CartService>(
  (ref) {
    return CartService();
  },
);
