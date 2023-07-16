import 'package:ecommerce_ui/constants/themes.dart';
import 'package:ecommerce_ui/models/product_model.dart';
import 'package:ecommerce_ui/views/cart.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.itemBag,
    required this.title,
  });

  final List<ProductModel> itemBag;
  final String title;

  @override
  Widget build(BuildContext context) {
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
            label: Text(itemBag.length.toString()),
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
              ),
            ),
          ),
        )
      ],
    );
  }
}
