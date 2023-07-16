import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF2E4054);
const Color kSecondaryColor = Color(0xFF010026);
const Color kThirdColor = Color(0xFFFFDCBC);
const Color kLightBackground = Color(0xFFE8F6FB);
const Color kWhiteColor = Colors.white;
const Color kBlackColor = Colors.black;

class AppTheme {
  static const kBigTitle = TextStyle(
    color: kWhiteColor,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static const kHeadingOne = TextStyle(
    fontSize: 18,
    color: kSecondaryColor,
    fontWeight: FontWeight.w500,
  );

  static const kSeeAllText = TextStyle(color: kPrimaryColor);

  static final kBodyText = TextStyle(
    color: Colors.grey.shade500,
    fontSize: 12,
  );

  static const kCardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}

class MediaQueries {
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation.index == 0
        ? getWidth(context)
        : getHeight(context);
  }

  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  // size of text
  static double getTextScaleFactor(BuildContext context) {
    return MediaQuery.of(context).textScaleFactor;
  }
}
