import 'package:flutter/material.dart';
class Palette {
  static const MaterialColor swatchToDark = MaterialColor(
    0xff2ebb9f, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
     <int, Color>{
      50:  Color(0xff29a88f),//10%
      100:  Color(0xff25967f),//20%
      200:  Color(0xff20836f),//30%
      300:  Color(0xff1c705f),//40%
      400:  Color(0xffE50914),//50%
      500:  Color(0xff124b40),//60%
      600:  Color(0xff0e3830),//70%
      700:  Color(0xff092520),//80%
      800:  Color(0xff051310),//90%
      900:  Color(0xff000000),//100%
    },
  );
  static const MaterialColor swatchToLight = MaterialColor(
    0xff2ebb9f, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50:  Color(0xff43c2a9),//10%
      100:  Color(0xff58c9b2),//20%
      200:  Color(0xff6dcfbc),//30%
      300:  Color(0xff82d6c5),//40%
      400:  Color(0xff97ddcf),//50%
      500:  Color(0xffabe4d9),//60%
      600:  Color(0xffc0ebe2),//70%
      700:  Color(0xffd5f1ec),//80%
      800:  Color(0xffeaf8f5),//90%
      900:  Color(0xffffffff),//100%
    },
  );
}