import 'package:ecommerce_ui/models/category_model.dart';
import 'package:ecommerce_ui/service/category_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final FutureProvider<CategoryModel> categoryNotifierProvider =
    FutureProvider<CategoryModel>(
  (ref) async {
    final CategoryService categoryService = ref.watch(categoryServiceProvider);
    return categoryService.fetchCategories();
  },
);
