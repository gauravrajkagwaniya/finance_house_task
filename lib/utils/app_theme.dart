import '../global.dart';

ThemeData getAppTheme(Brightness brightness) {
  return ThemeData(
    brightness: brightness,
    primaryColor: Styles.primaryColor,
    primaryColorDark: Styles.primaryDarkColor,
    scaffoldBackgroundColor: brightness == Brightness.light
        ? Styles.whiteColors
        : Styles.blackColors,
    appBarTheme: AppBarTheme(
      color: brightness == Brightness.light
          ? Styles.primaryColor
          : Styles.primaryDarkColor,
      iconTheme: IconThemeData(
        color: brightness == Brightness.light
            ? Styles.blackColors
            : Styles.whiteColors,
      ),
    ),
    iconTheme: IconThemeData(
      color: brightness == Brightness.light
          ? Styles.blackColors
          : Styles.whiteColors,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontFamily: ExtraStrings.fontName,
        color: brightness == Brightness.light
            ? Styles.primaryTextColors
            : Styles.whiteColors,
        fontSize: Styles.txt16,
      ),
      bodyLarge: TextStyle(
        fontFamily: ExtraStrings.fontName,
        color: brightness == Brightness.light
            ? Styles.secTextColors
            : Styles.whiteColors,
        fontSize: Styles.txt14,
      ),
      headlineMedium: TextStyle(
        fontFamily: ExtraStrings.fontName,
        color: brightness == Brightness.light
            ? Styles.primaryColor
            : Styles.netflixColors,
        fontSize: Styles.txt24,
        fontWeight: FontWeight.bold,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Styles.primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: brightness == Brightness.light
          ? Styles.whiteColors
          : Styles.blackColors,
    ),
  );
}