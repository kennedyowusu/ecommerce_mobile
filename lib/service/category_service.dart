import 'package:dio/dio.dart';
import 'package:ecommerce_ui/models/category_model.dart';
import 'package:ecommerce_ui/service/endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class CategoryService {
  final GetStorage storage = GetStorage();
  final Dio dio = Dio();

  Future<CategoryModel> fetchCategories() async {
    final response = await dio.get(
      categoriesURL,
      options: Options(
        headers: {
          'Authorization': 'Bearer ${storage.read('token')}',
          'Content-Type': 'application/json',
        },
      ),
    );

    debugPrint(response.data.toString());

    if (response.statusCode != 200) {
      final errorMessage = response.data['message'] as String;
      throw Exception(errorMessage);
    } else {
      final CategoryModel categoryModel = CategoryModel.fromJson(response.data);
      debugPrint(categoryModel.toString());
      return categoryModel;
    }
  }
}

final Provider<CategoryService> categoryServiceProvider =
    Provider<CategoryService>(
  (ref) {
    return CategoryService();
  },
);
