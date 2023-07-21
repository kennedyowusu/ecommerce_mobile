import 'package:ecommerce_ui/models/products_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<ProductsModel> allProducts = [];

class ItemBagNotifier extends StateNotifier<List<ProductsModel>> {
  ItemBagNotifier() : super(allProducts);

  void addNewItemBag(ProductsModel productModel) {
    state = [...state, productModel];
  }

  void removeItem(int pid) {
    state = [
      for (final product in state)
        if (product.id != pid) product,
    ];
  }
}

final StateNotifierProvider<ItemBagNotifier, List<ProductsModel>>
    itemBagProvider =
    StateNotifierProvider<ItemBagNotifier, List<ProductsModel>>((ref) {
  return ItemBagNotifier();
});

final StateProvider<double> priceCalcProvider = StateProvider<double>((ref) {
  final List<ProductsModel> itemBag = ref.watch(itemBagProvider);

  double sum = 0;
  for (var element in itemBag) {
    sum += element.price as double;
  }
  return sum;
});
