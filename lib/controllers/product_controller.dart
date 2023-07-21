// import 'package:ecommerce_ui/models/products_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ProductNotifierController extends StateNotifier<List<ProductsModel>> {
//   ProductNotifierController() : super();

//   void isSelectItem(int pid, int index) {
//     state = [
//       for (final product in state)
//         if (product.id == pid)
//           product.copyWith(isSelected: !state[index].isSelected)
//         else
//           product,
//     ];
//   }

//   void incrementQty(int pid) {
//     state = [
//       for (final product in state)
//         if (product.id == pid)
//           product.copyWith(qty: product.qty += 1)
//         else
//           product,
//     ];
//   }

//   void decreaseQty(int pid) {
//     state = [
//       for (final product in state)
//         if (product.id == pid)
//           product.copyWith(qty: product.qty -= 1)
//         else
//           product,
//     ];
//   }
// }

// final StateNotifierProvider<ProductNotifierController, List<ProductsModel>>
//     productNotifierProvider =
//     StateNotifierProvider<ProductNotifierController, List<ProductsModel>>(
//         (ref) {
//   return ProductNotifierController();
// });
