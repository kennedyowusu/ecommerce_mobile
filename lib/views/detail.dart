// import 'package:ecommerce_ui/controllers/itembag_controller.dart';
// import 'package:ecommerce_ui/models/product_model.dart';
// import 'package:ecommerce_ui/widgets/appbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:gap/gap.dart';

// import '../constants/themes.dart';
// import '../controllers/product_controller.dart';

// class ProductDetailsView extends ConsumerWidget {
//   const ProductDetailsView({super.key, required this.getIndex});

//   final int getIndex;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final List<ProductModel> product = ref.watch(productNotifierProvider);
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size(double.infinity, 60.0),
//         child: CustomAppBar(itemBag: itemBag, title: 'Product Details'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 300,
//               width: double.infinity,
//               color: kLightBackground,
//               child: Image.asset(product[getIndex].imgUrl),
//             ),
//             Container(
//               padding: const EdgeInsets.all(30),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     product[getIndex].title,
//                     style: AppTheme.kBigTitle.copyWith(color: kPrimaryColor),
//                   ),
//                   const Gap(12),
//                   Row(
//                     children: [
//                       RatingBar(
//                         itemSize: 20,
//                         initialRating: 1,
//                         minRating: 1,
//                         maxRating: 5,
//                         allowHalfRating: true,
//                         ratingWidget: RatingWidget(
//                           empty: const Icon(
//                             Icons.star_border,
//                             color: Colors.amber,
//                           ),
//                           full: const Icon(
//                             Icons.star,
//                             color: Colors.amber,
//                           ),
//                           half: const Icon(
//                             Icons.star_half_sharp,
//                             color: Colors.amber,
//                           ),
//                         ),
//                         // ignore: avoid_returning_null_for_void
//                         onRatingUpdate: (value) => null,
//                       ),
//                       const Gap(12),
//                       const Text('125 review')
//                     ],
//                   ),
//                   const Gap(8),
//                   Text(product[getIndex].longDescription),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '\$${product[getIndex].price * product[getIndex].qty}',
//                         style: AppTheme.kHeadingOne,
//                       ),
//                       Row(children: [
//                         IconButton(
//                           onPressed: () {
//                             ref
//                                 .read(productNotifierProvider.notifier)
//                                 .decreaseQty(product[getIndex].pid);
//                           },
//                           icon: const Icon(
//                             Icons.do_not_disturb_on_outlined,
//                             size: 30,
//                           ),
//                         ),
//                         Text(
//                           product[getIndex].qty.toString(),
//                           style: AppTheme.kCardTitle.copyWith(fontSize: 24),
//                         ),
//                         IconButton(
//                             onPressed: () {
//                               ref
//                                   .read(productNotifierProvider.notifier)
//                                   .incrementQty(product[getIndex].pid);
//                             },
//                             icon: const Icon(
//                               Icons.add_circle_outline,
//                               size: 30,
//                             ))
//                       ]),
//                     ],
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: kPrimaryColor,
//                         minimumSize: const Size(double.infinity, 50)),
//                     onPressed: () {},
//                     child: const Text('Add item to bag'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
