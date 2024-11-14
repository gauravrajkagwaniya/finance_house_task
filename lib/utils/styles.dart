import 'package:flutter/material.dart';
// make a new function to get primary,secondary color and move black,white color to constants

abstract class Styles {
//  COLORS
  static const Color primaryColor = Colors.transparent;
  static const Color primaryDarkColor = Colors.black;
  static const Color trans = Colors.transparent;
  static const Color whiteColors = Color(0xFFffffff);
  static const Color blackColors = Colors.black;
  static const Color accentColor = Color(0xFFFF4081);
  static const Color primaryTextColors = Color(0xFF212121);
  static const Color secTextColors = Color(0xFF757575);
  static const Color netflixColors = Color(0xffE50914);

  //font sizes

  static double extSmall = 6;

  static double txt16 = 16.0;

  static double txt24 = 24.0;

  static double txt14 = 14.0;

  static bool isBright( BuildContext context, {bool reverse= false}) {
    Brightness brightness = Theme.of(context).brightness;
    if (brightness == Brightness.light) {
      return true;
    } else {
      return false;
    }
  }
}
