import 'package:ecommerce_ui/constants/colors.dart';
import 'package:ecommerce_ui/constants/themes.dart';
import 'package:ecommerce_ui/models/category_model.dart';
import 'package:ecommerce_ui/models/products_model.dart';
import 'package:ecommerce_ui/providers/providers.dart';
import 'package:ecommerce_ui/views/detail.dart';
import 'package:ecommerce_ui/widgets/ads_banner_widget.dart';
import 'package:ecommerce_ui/widgets/appbar.dart';
import 'package:ecommerce_ui/widgets/card_widget.dart';
import 'package:ecommerce_ui/widgets/chip_widget.dart';
import 'package:ecommerce_ui/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ProductResponseModel> products =
        ref.watch(productNotifierProvider);

    final AsyncValue<CategoryModel> categoryController =
        ref.watch(categoryNotifierProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60.0),
        child: CustomAppBar(
          title: 'Home',
        ),
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(
              MediaQueries.isPortrait(context) ? 15 : 40,
            ),
            child: Column(
              children: [
                const AdsBannerWidget(),
                Gap(MediaQueries.isPortrait(context) ? 5 : 40),
                SizedBox(
                  height: 50,
                  child: categoryController.when(
                    data: (data) => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: data.data.length,
                      itemBuilder: (context, index) => ChipWidget(
                        chipLabel: data.data[index].name,
                      ),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(
                        color: deepBlue,
                      ),
                    ),
                    error: (error, stackTrace) => Text(error.toString()),
                  ),
                ),
                // Hot sales section
                Gap(
                  MediaQueries.isPortrait(context) ? 5 : 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Flash Sales', style: AppTheme.kHeadingOne),
                    Text(
                      'See all',
                      style: AppTheme.kSeeAllText,
                    ),
                  ],
                ),

                Container(
                  padding: const EdgeInsets.all(4),
                  width: double.infinity,
                  height: 300,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(4),
                    itemCount: products.when(
                      data: (data) => data.data.length,
                      loading: () => 0,
                      error: (error, stackTrace) => 0,
                    ),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        ProductCardWidget(productIndex: index),
                  ),
                ),
                // Featured products
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Featured Products', style: AppTheme.kHeadingOne),
                    Text(
                      'See all',
                      style: AppTheme.kSeeAllText,
                    ),
                  ],
                ),

                MasonryGridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.when(
                    data: (data) => data.data.length,
                    loading: () => 0,
                    error: (error, stackTrace) => 0,
                  ),
                  shrinkWrap: true,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailsView(getIndex: index),
                      ),
                    ),
                    child: SizedBox(
                      height: 250,
                      child: ProductCardWidget(productIndex: index),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
