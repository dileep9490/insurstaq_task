import 'package:flutter/widgets.dart';

class SizeConfig {
  static double? heightUnitBlock;
  static double? widthUnitBlock;

  void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    heightUnitBlock = mediaQuery.size.height / 100;
    widthUnitBlock = mediaQuery.size.width / 100;
  }
}
