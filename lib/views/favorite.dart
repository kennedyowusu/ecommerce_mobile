import 'package:ecommerce_ui/controllers/itembag_controller.dart';
import 'package:ecommerce_ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteView extends ConsumerWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemBag = ref.watch(itemBagProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60.0),
        child: CustomAppBar(itemBag: itemBag, title: 'Favorite'),
      ),
      drawer: const Drawer(),
      body: const Center(
        child: Text("Favorite"),
      ),
    );
  }
}
