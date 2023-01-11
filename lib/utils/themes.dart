import 'package:flutter/material.dart';

import 'constants.dart';

class Themes {
  static var lightTheme = ThemeData(
    textTheme: const TextTheme().copyWith(
      headline4: const TextStyle(
        color: kNavyTextColor,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      headline2: const TextStyle(
        color: kNavyTextColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      headline5: const TextStyle(
        color: kNavyTextColor,
      ),
      headline6: const TextStyle(
        color: kNavyTextColor,
      ),
      bodyText1: const TextStyle(
        color: kNavyTextColor,
      ),
      bodyText2: const TextStyle(
        color: kNavyTextColor,
      ),
    ),
    primaryColor: kPrimaryColor,
    splashColor: kSplashColor,
    scaffoldBackgroundColor: kBaseColor,
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      background: kBaseColor,
      tertiary: kTertiaryColor,
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(kSecondaryColor),
    ),
  );
}
