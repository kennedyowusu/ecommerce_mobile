import 'package:ecommerce_ui/models/products_model.dart';
import 'package:ecommerce_ui/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import '../constants/themes.dart';

class ProductCardWidget extends ConsumerWidget {
  const ProductCardWidget({
    super.key,
    required this.productIndex,
  });

  final int productIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ProductResponseModel> product =
        ref.watch(productNotifierProvider);
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 6),
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      margin: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              margin: const EdgeInsets.all(12),
              color: kLightBackground,
              child: Image.network(
                product.when(
                  data: (data) => data.data[productIndex].image.toString() == ''
                      ? 'assets/products/I1.png'
                      : data.data[productIndex].image.toString(),
                  loading: () => "Loading...",
                  error: (e, s) => 'Error: $e',
                ),
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
            ),
          ),
          const Gap(4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.when(
                    data: (data) => data.data[productIndex].name,
                    loading: () => "Loading...",
                    error: (e, s) => 'Error: $e',
                  ),
                  style: AppTheme.kCardTitle,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  product.when(
                    data: (data) => data.data[productIndex].description,
                    loading: () => "Loading...",
                    error: (e, s) => 'Error: $e',
                  ),
                  style: AppTheme.kBodyText,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.when(
                        data: (data) => '\$${data.data[productIndex].price}',
                        loading: () => "Loading...",
                        error: (e, s) => 'Error: $e',
                      ),
                      style: AppTheme.kCardTitle,
                    ),
                    IconButton(
                      // onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 30,
                      ),
                      onPressed: () {
                        // ref.read(productNotifierProvider.notifier).isSelectItem(
                        //     product[productIndex].pid, productIndex);

                        // if (product[productIndex].isSelected == false) {
                        //   ref.read(itemBagProvider.notifier).addNewItemBag(
                        //         ProductModel(
                        //           pid: product[productIndex].pid,
                        //           imgUrl: product[productIndex].imgUrl,
                        //           title: product[productIndex].title,
                        //           price: product[productIndex].price,
                        //           shortDescription:
                        //               product[productIndex].shortDescription,
                        //           longDescription:
                        //               product[productIndex].longDescription,
                        //           review: product[productIndex].review,
                        //           rating: product[productIndex].rating,
                        //         ),
                        //       );
                        // } else {
                        //   ref
                        //       .read(itemBagProvider.notifier)
                        //       .removeItem(product[productIndex].pid);
                        // }
                      },
                      // icon: Icon(
                      //   product[productIndex].isSelected
                      //       ? Icons.check_circle
                      //       : Icons.add_circle,
                      //   size: 30,
                      // ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
