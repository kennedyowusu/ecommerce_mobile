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
    // final List<ProductModel> product = ref.watch(productNotifierProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60.0),
        child: CustomAppBar(cartItem: [], title: 'Product Details'),
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
              child: Image.asset(
                "assets/products/I1.png",
                fit: BoxFit.cover,
                height: 200,
                width: 200,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Name",
                    style: AppTheme.kBigTitle.copyWith(color: kPrimaryColor),
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
                  Text("description" * 1),
                  const Gap(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: AppTheme.kHeadingOne,
                      ),
                      Row(children: [
                        IconButton(
                          onPressed: () {
                            // ref
                            //     .read(productNotifierProvider.notifier)
                            //     .decreaseQty(product[getIndex].pid);
                          },
                          icon: const Icon(
                            Icons.do_not_disturb_on_outlined,
                            size: 30,
                          ),
                        ),
                        Text(
                          "Quantity",
                          style: AppTheme.kCardTitle.copyWith(fontSize: 24),
                        ),
                        IconButton(
                            onPressed: () {
                              // ref
                              //     .read(productNotifierProvider.notifier)
                              //     .incrementQty(product[getIndex].pid);
                            },
                            icon: const Icon(
                              Icons.add_circle_outline,
                              size: 30,
                            ))
                      ]),
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
