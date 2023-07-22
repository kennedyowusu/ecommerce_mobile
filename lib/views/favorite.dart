import 'package:ecommerce_ui/controllers/cart_items_controller.dart';
import 'package:ecommerce_ui/models/products_model.dart';
import 'package:ecommerce_ui/widgets/appbar.dart';
import 'package:ecommerce_ui/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteView extends ConsumerWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ProductsModel> cartItem = ref.watch(itemBagProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60.0),
        child: CustomAppBar(cartItem: [], title: 'Favorite'),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Favorite"),
      ),
    );
  }
}
