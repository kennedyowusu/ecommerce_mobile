import 'package:ecommerce_ui/models/category_model.dart';
import 'package:ecommerce_ui/service/category_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryController extends StateNotifier<CategoryModel> {
  CategoryController(this.categoryService) : super(CategoryModel(data: []));
  final CategoryService categoryService;

  Future<void> fetchCategories() async {
    try {
      state = CategoryModel(data: []);
      final CategoryModel categories = await categoryService.fetchCategories();
      state = categories;
      debugPrint(categories.toString());
    } catch (e) {
      state = CategoryModel(data: []);
      debugPrint(e.toString());
      throw Exception(e);
    }
  }
}

final StateNotifierProvider<CategoryController, CategoryModel>
    categoryControllerProvider =
    StateNotifierProvider<CategoryController, CategoryModel>(
  (ref) {
    final CategoryService categoryService = ref.watch(categoryServiceProvider);
    return CategoryController(categoryService);
  },
);
