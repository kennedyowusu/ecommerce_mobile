import 'package:ecommerce_ui/controllers/cart_items_controller.dart';
import 'package:ecommerce_ui/models/cart_model.dart';
import 'package:ecommerce_ui/models/products_model.dart';
import 'package:ecommerce_ui/providers/providers.dart';
import 'package:ecommerce_ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../constants/themes.dart';

class ProductCartView extends ConsumerWidget {
  const ProductCartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<CartResponseModel> cartItem =
        ref.watch(cartNotifierProvider);

    final AsyncValue<ProductResponseModel> productController =
        ref.watch(productNotifierProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60.0),
        child: CustomAppBar(

          title: 'Cart',
        ),
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(20),
              color: kLightBackground,
              child: ListView.builder(
                itemCount: cartItem.when(
                  data: (data) => data.data.length,
                  error: (error, stackTrace) => 0,
                  loading: () => 0,
                ),
                itemBuilder: (context, index) => Card(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: double.infinity,
                    child: ListTile(
                      // leading: Image.network(
                      //   productController.when(
                      //     data: (data) => data.data[index].image,
                      //     error: (error, stackTrace) => '',
                      //     loading: () => '',
                      //   ),
                      // ),

                      leading: Icon(Icons.image),
                      title: Text(
                        productController.when(
                          data: (data) => data.data[index].name,
                          error: (error, stackTrace) => '',
                          loading: () => '',
                        ),
                        style: AppTheme.kCardTitle,
                      ),
                      // subtitle: Text(
                      //   productController.when(
                      //     data: (data) => data.data[index].description,
                      //     error: (error, stackTrace) => '',
                      //     loading: () => '',
                      //   ),
                      //   style: AppTheme.kBodyText,
                      // ),
                      trailing: Text(
                        '\$${productController.when(
                          data: (data) => data.data[index].price,
                          error: (error, stackTrace) => '',
                          loading: () => '',
                        )}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Have a coupon code? enter here'),
                    const Gap(12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1,
                          color: kPrimaryColor,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'FDS2023',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: const [
                              Text(
                                'Available',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Gap(5),
                              Icon(Icons.check_circle)
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Gap(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Delivery Fee:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Free',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Discount:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'No discount',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total:',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor),
                        ),
                        Text(
                          '\$${ref.watch(priceCalcProvider)}',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
