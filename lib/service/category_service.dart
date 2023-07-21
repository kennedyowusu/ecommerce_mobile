import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_ui/models/category_model.dart';
import 'package:ecommerce_ui/service/endpoint.dart';
import 'package:ecommerce_ui/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class CategoryService {
  final GetStorage storage = GetStorage();
  final Dio dio = Dio();

  Future<CategoryModel> fetchCategories() async {
    final token = storage.read('token');

    if (token == null) {
      throw Exception('Token is null');
    } else {
      debugPrint(token);
    }

    final response = await dio.get(
      categoriesURL,
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
      ToastWidget(message: errorMessage);
      throw Exception(errorMessage);
    } else {
      return categoryModelFromJson(json.encode(response.data));
    }
  }
}

final Provider<CategoryService> categoryServiceProvider =
    Provider<CategoryService>(
  (ref) {
    return CategoryService();
  },
);
