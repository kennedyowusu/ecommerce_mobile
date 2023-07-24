import 'package:ecommerce_ui/constants/themes.dart';
import 'package:ecommerce_ui/models/favorite_model.dart';
import 'package:ecommerce_ui/models/products_model.dart';
import 'package:ecommerce_ui/providers/providers.dart';
import 'package:ecommerce_ui/providers/states/favorite_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class FavoriteProductCard extends ConsumerWidget {
  const FavoriteProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ProductResponseModel> productController =
        ref.watch(productNotifierProvider);

    final List<FavoriteModel> favoriteController =
        ref.watch(favoriteStateNotifierProvider);

    return Card(
      elevation: 2,
      child: ListTile(
        leading: productController.when(
          data: (data) => Text(
            data.data[0].name,
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          ),
          error: (error, stackTrace) => Text(error.toString()),
        ),
        title: productController.when(
          data: (data) => Text(
            '\$${data.data[0].price}',
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 16,
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          ),
          error: (error, stackTrace) => Text(error.toString()),
        ),
        trailing: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: kPrimaryColor,
              ),
            ),
            child: Icon(
              Icons.delete_outline_sharp,
              color: Colors.red,
              size: 20,
            ),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    'Delete Item',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  content: const Text(
                    'Are you sure you want to delete this item?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        final int productId = productController.when(
                          data: (data) => data.data[0].id,
                          loading: () => 0,
                          error: (e, s) => 0,
                        );

                        final GetStorage storage = GetStorage();

                        final FavoriteModel favoriteModelToRemove =
                            favoriteController.firstWhere(
                          (favorite) =>
                              favorite.productId == productId.toString(),
                          orElse: () => FavoriteModel(
                            id: 0,
                            productId: productId.toString(),
                            userId: storage.read('userId').toString(),
                          ),
                        );

                        ref
                            .read(favoriteStateNotifierProvider.notifier)
                            .removeProductFromFavorite(favoriteModelToRemove);

                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
