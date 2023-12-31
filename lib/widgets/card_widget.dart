import 'package:ecommerce_ui/models/cart_model.dart';
import 'package:ecommerce_ui/models/products_model.dart';
import 'package:ecommerce_ui/providers/cart_state_notifier.dart';
import 'package:ecommerce_ui/providers/providers.dart';
import 'package:ecommerce_ui/service/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:get_storage/get_storage.dart';
import '../constants/themes.dart';

class ProductCardWidget extends ConsumerWidget {
  ProductCardWidget({
    super.key,
    required this.productIndex,
  });

  final int productIndex;
  final GetStorage storage = GetStorage();
  final CartService cartService = CartService();

  String truncateDescription(String description) {
    return description.length > 17
        ? '${description.substring(0, 25)}...'
        : description;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ProductResponseModel> product =
        ref.watch(productNotifierProvider);

    final List<CartModel> cart = ref.watch(cartStateNotifierProvider);

    final int productId = product.when(
      data: (data) => data.data[productIndex].id,
      loading: () => 0,
      error: (e, s) => 0,
    );

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
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.5,
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
                    data: (data) => truncateDescription(
                        data.data[productIndex].description),
                    loading: () => "Loading...",
                    error: (e, s) => 'Error: $e',
                  ),
                  style: AppTheme.kBodyText,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
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
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 30,
                      ),
                      color: kPrimaryColor,
                      onPressed: () {
                        final int userId = storage.read("userId");

                        final int productId = product.when(
                          data: (data) => data.data[productIndex].id,
                          loading: () => 0,
                          error: (e, s) => 0,
                        );

                        final double productPrice = product.when(
                          data: (data) =>
                              double.parse(data.data[productIndex].price),
                          loading: () => 0,
                          error: (e, s) => 0,
                        );

                        cartService.addToCart(
                          userId,
                          productId,
                          1,
                          productPrice,
                        );
                        debugPrint('Cart: $cart');
                      },
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
