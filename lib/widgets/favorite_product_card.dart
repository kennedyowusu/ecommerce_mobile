import 'package:ecommerce_ui/constants/themes.dart';
import 'package:ecommerce_ui/models/products_model.dart';
import 'package:ecommerce_ui/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteProductCard extends ConsumerWidget {
  const FavoriteProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ProductResponseModel> productController =
        ref.watch(productNotifierProvider);

    return Card(
      elevation: 2,
      child: ListTile(
        title: productController.when(
          data: (data) => Text(
            data.data[0].name,
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
        subtitle: productController.when(
          data: (data) => Text(
            data.data[0].description,
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 14,
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
            // ref.read(cartServiceProvider).deleteCartItem(

            // show dialog when a user clicks on delete icon
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
                        // ref.read(cartServiceProvider).deleteCartItem(
                        //   cartId: cartController.data!.data[index].id,
                        // );
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
