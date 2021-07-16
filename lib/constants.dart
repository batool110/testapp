import 'package:flutter/material.dart';

final Color primaryColor = Colors.amber;
final Color lightColor = Colors.amber[100];
final Color textGrey = Colors.grey;

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(16),
  fontWeight: FontWeight.w700,
  color: Colors.black,
  height: 1.5,
);

final dayStyle = TextStyle(
  fontSize: getProportionateScreenWidth(18),
  fontWeight: FontWeight.w700,
  color: Colors.grey[800],
  height: 1.5,
);

final monthStyle = TextStyle(
  fontSize: getProportionateScreenWidth(16),
  color: Colors.grey[600],
  fontWeight: FontWeight.w800,
);

final amountStyle = TextStyle(
  fontSize: getProportionateScreenWidth(15),
  fontWeight: FontWeight.w700,
  color: Colors.grey[800],
);

final currStyle = TextStyle(
  fontSize: getProportionateScreenWidth(15),
  color: Colors.grey,
  fontWeight: FontWeight.w600,
);

final primaryHeading = TextStyle(
  fontSize: getProportionateScreenWidth(30),
  color: primaryColor,
  fontWeight: FontWeight.w700,
);

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
