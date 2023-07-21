import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_ui/models/products_model.dart';
import 'package:ecommerce_ui/service/endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class ProductService {
  final GetStorage storage = GetStorage();
  final Dio dio = Dio();

  Future<ProductResponseModel> fetchProducts() async {
    final token = storage.read('token');

    if (token == null) {
      throw Exception('Token is null');
    } else {
      debugPrint(token);
    }

    final response = await dio.get(
      productURL,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    debugPrint(response.data['data'].toString());

    if (response.statusCode != 200) {
      final errorMessage = response.data['message'];
      debugPrint(errorMessage);
      throw Exception(errorMessage);
    } else {
      return productModelFromJson(json.encode(response.data));
    }
  }
}

final Provider<ProductService> productServiceProvider =
    Provider<ProductService>(
  (ref) {
    return ProductService();
  },
);
