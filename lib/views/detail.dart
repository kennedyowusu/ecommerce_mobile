import 'package:ecommerce_ui/models/favorite_model.dart';
import 'package:ecommerce_ui/models/products_model.dart';
import 'package:ecommerce_ui/providers/providers.dart';
import 'package:ecommerce_ui/providers/states/favorite_state_notifier.dart';
import 'package:ecommerce_ui/service/favorite_service.dart';
import 'package:ecommerce_ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/themes.dart';

class ProductDetailsView extends ConsumerWidget {
  ProductDetailsView({super.key, required this.getIndex});

  final int getIndex;
  final GetStorage storage = GetStorage();
  final FavoriteService cartService = FavoriteService();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ProductResponseModel> productController =
        ref.watch(productNotifierProvider);

    final AsyncValue<FavoriteResponseModel> favoriteController =
        ref.watch(favoriteNotifierProvider);

    final List<FavoriteModel> favorite =
        ref.watch(favoriteStateNotifierProvider);

    final int productId = productController.when(
      data: (data) => data.data[getIndex].id,
      loading: () => 0,
      error: (e, s) => 0,
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60.0),
        child: CustomAppBar(
          title: 'Product Details',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                padding: const EdgeInsets.all(42),
                color: Colors.transparent,
                child: productController.when(
                  data: (data) => data.data[getIndex].image == null
                      ? Image.asset(
                          'assets/products/I1.png',
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                        )
                      : Image.network(
                          data.data[getIndex].image,
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (e, s) => Text(e.toString()),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        productController.when(
                          data: (data) => Text(
                            data.data[getIndex].name,
                            style: AppTheme.kCardTitle
                                .copyWith(color: kPrimaryColor),
                          ),
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          error: (e, s) => Text(e.toString()),
                        ),
                        productController.when(
                          data: (data) => Text(
                            "\$${data.data[getIndex].price}",
                            style: AppTheme.kCardTitle.copyWith(fontSize: 16),
                          ),
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          error: (e, s) => Text(e.toString()),
                        ),
                      ],
                    ),
                    const Gap(12),
                    Row(
                      children: [
                        RatingBar(
                          itemSize: 20,
                          initialRating: 1,
                          minRating: 1,
                          maxRating: 5,
                          allowHalfRating: true,
                          ratingWidget: RatingWidget(
                            empty: const Icon(
                              Icons.star_border,
                              color: Colors.amber,
                            ),
                            full: const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            half: const Icon(
                              Icons.star_half_sharp,
                              color: Colors.amber,
                            ),
                          ),
                          onRatingUpdate: (value) => null,
                        ),
                        const Gap(12),
                        const Text('125 review')
                      ],
                    ),
                    const Gap(8),
                    productController.when(
                      data: (data) => Text(data.data[getIndex].description,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          )),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      error: (e, s) => Text(e.toString()),
                    ),
                    const Gap(8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 60,
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: favorite.isNotEmpty
                ? favorite.any((element) => element.id == productId)
                    ? Colors.grey
                    : kPrimaryColor
                : kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            favorite.isNotEmpty
                ? favorite.any((element) => element.id == productId)
                    ? null
                    : () {
                        final int userId = storage.read("userId");

                        final int productId = favoriteController.when(
                          data: (data) => data.data[getIndex].id,
                          loading: () => 0,
                          error: (e, s) => 0,
                        );

                        cartService.addToFavorite(userId, productId);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Added to Favorite'),
                          ),
                        );

                        debugPrint(
                          "Favorite Length: ${ref.watch(favoriteStateNotifierProvider).length}",
                        );
                      }
                : null;
          },
          child: const Text(
            'Add to Favorite',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
