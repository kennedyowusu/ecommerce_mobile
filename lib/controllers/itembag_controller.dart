import 'package:ecommerce_ui/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<ProductModel> itemBag = [];

class ItemBagNotifier extends StateNotifier<List<ProductModel>> {
  ItemBagNotifier() : super(itemBag);

  void addNewItemBag(ProductModel productModel) {
    state = [...state, productModel];
  }

  void removeItem(int pid) {
    state = [
      for (final product in state)
        if (product.pid != pid) product,
    ];
  }
}

final StateNotifierProvider<ItemBagNotifier, List<ProductModel>>
    itemBagProvider =
    StateNotifierProvider<ItemBagNotifier, List<ProductModel>>((ref) {
  return ItemBagNotifier();
});

final StateProvider<double> priceCalcProvider = StateProvider<double>((ref) {
  final List<ProductModel> itemBag = ref.watch(itemBagProvider);

  double sum = 0;
  for (var element in itemBag) {
    sum += element.price;
  }
  return sum;
});
