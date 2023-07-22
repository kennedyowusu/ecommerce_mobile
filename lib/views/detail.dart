import 'package:ecommerce_ui/models/products_model.dart';
import 'package:ecommerce_ui/providers/providers.dart';
import 'package:ecommerce_ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../constants/themes.dart';

class ProductDetailsView extends ConsumerWidget {
  const ProductDetailsView({super.key, required this.getIndex});

  final int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ProductResponseModel> productController =
        ref.watch(productNotifierProvider);

    debugPrint("product: $productController");
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60.0),
        child: CustomAppBar(
          cartItem: [],
          title: 'Product Details',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              padding: const EdgeInsets.all(42),
              color: kLightBackground,
              child: productController.when(
                data: (data) => data.data[getIndex].image == null
                    ? Image.asset(
                        'assets/products/I1.png',
                        fit: BoxFit.contain,
                        height: 300,
                        width: 300,
                      )
                    : Image.network(
                        data.data[getIndex].image,
                        fit: BoxFit.contain,
                        height: 300,
                        width: 300,
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
                  productController.when(
                    data: (data) => Text(
                      data.data[getIndex].name,
                      style: AppTheme.kBigTitle.copyWith(color: kPrimaryColor),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (e, s) => Text(e.toString()),
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
                        // ignore: avoid_returning_null_for_void
                        onRatingUpdate: (value) => null,
                      ),
                      const Gap(12),
                      const Text('125 review')
                    ],
                  ),
                  const Gap(8),
                  productController.when(
                    data: (data) => Text(
                      data.data[getIndex].description,
                      style: AppTheme.kCardTitle.copyWith(fontSize: 18),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (e, s) => Text(e.toString()),
                  ),
                  const Gap(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      productController.when(
                        data: (data) => Text(
                          "\$${data.data[getIndex].price}",
                          style: AppTheme.kCardTitle.copyWith(fontSize: 24),
                        ),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        error: (e, s) => Text(e.toString()),
                      ),
                    ],
                  ),
                  const Gap(8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        minimumSize: const Size(double.infinity, 50)),
                    onPressed: () {},
                    child: Text(
                      'Add Item to Cart',
                      style: AppTheme.kCardTitle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
