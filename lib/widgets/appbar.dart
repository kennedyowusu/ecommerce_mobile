import 'package:ecommerce_ui/constants/themes.dart';
import 'package:ecommerce_ui/models/cart_model.dart';
import 'package:ecommerce_ui/providers/providers.dart';
import 'package:ecommerce_ui/views/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerWidget {
  CustomAppBar({
    super.key,
    required this.title,
    this.icon,
  });

  final String title;
  final IconButton? icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<CartResponseModel> cartItem =
        ref.watch(cartNotifierProvider);
    return AppBar(
      backgroundColor: kSecondaryColor,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: kWhiteColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 10),
          child: Badge(
            label: Text(
              cartItem.when(
                data: (data) => data.data.length.toString(),
                loading: () => '0',
                error: (e, s) => '0',
              ),
              style: const TextStyle(
                color: kWhiteColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductCartView(),
                  ),
                );
              },
              icon: const Icon(
                Icons.local_mall,
                size: 24,
                color: kWhiteColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
