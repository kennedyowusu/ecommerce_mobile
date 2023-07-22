import 'package:ecommerce_ui/constants/themes.dart';
import 'package:ecommerce_ui/models/favorite_model.dart';
import 'package:ecommerce_ui/providers/providers.dart';
import 'package:ecommerce_ui/widgets/appbar.dart';
import 'package:ecommerce_ui/widgets/drawer.dart';
import 'package:ecommerce_ui/widgets/favorite_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteView extends ConsumerWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<FavoriteResponseModel> favoriteController =
        ref.watch(favoriteNotifierProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60.0),
        child: CustomAppBar(title: 'Favorite'),
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(
                MediaQueries.isPortrait(context) ? 15 : 40,
              ),
              child: favoriteController.when(
                data: (data) => data.data.isEmpty
                    ? const Center(
                        child: Text(
                          'No Favorite Item',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.data.length,
                        itemBuilder: (context, index) => FavoriteProductCard(),
                      ),
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
