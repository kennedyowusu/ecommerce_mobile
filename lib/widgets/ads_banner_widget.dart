import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../constants/themes.dart';

class AdsBannerWidget extends StatelessWidget {
  const AdsBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Apple Products',
                    style: AppTheme.kBigTitle,
                  ),
                  const Gap(8),
                  Text(
                    "Find the Apple product and accessories you're looking for at a great price in our online store.",
                    textWidthBasis: TextWidthBasis.longestLine,
                    style: AppTheme.kBodyText.copyWith(color: kWhiteColor),
                  ),
                  const Gap(4),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE5E5E5),
                      foregroundColor: kSecondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Proceed to Shop',
                      style: TextStyle(
                        fontSize: 14,
                        color: kSecondaryColor,
                        letterSpacing: 0.5,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Image.asset(
            'assets/products/I1.png',
            fit: BoxFit.contain,
            height:
                MediaQueries.getHeight(context) * 0.2, // 20% of height (170)
            width: MediaQueries.getWidth(context) * 0.25, // 25% of width (170)
          ),
        ],
      ),
    );
  }
}
