import 'package:ecommerce_ui/service/category_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryController extends StateNotifier {
  CategoryController(this.categoryService) : super(0);
  final CategoryService categoryService;

  void increment() => state++;
}
