import 'package:ecommerce_ui/constants/themes.dart';
import 'package:ecommerce_ui/controllers/itembag_controller.dart';
import 'package:ecommerce_ui/controllers/product_controller.dart';
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
    final products = ref.watch(productNotifierProvider);
    final itemBag = ref.watch(itemBagProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60.0),
        child: CustomAppBar(itemBag: itemBag, title: 'Home'),
      ),
      drawer: const AppDrawer(),
      // bottomNavigationBar: ProjectLayout(),
      body: SingleChildScrollView(
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
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: const [
                    ChipWidget(chipLabel: 'All'),
                    ChipWidget(chipLabel: 'Iphone X'),
                    ChipWidget(chipLabel: 'Iphone 11'),
                    ChipWidget(chipLabel: 'Iphone 12'),
                    ChipWidget(chipLabel: 'Iphone 13'),
                    ChipWidget(chipLabel: 'Iphone 14'),
                  ],
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
                  itemCount: 4,
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
                itemCount: products.length,
                shrinkWrap: true,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsView(getIndex: index),
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
    );
  }
}
