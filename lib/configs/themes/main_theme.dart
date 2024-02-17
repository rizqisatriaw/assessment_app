import 'package:flutter/material.dart';

import 'color_themes.dart';

final ThemeData mainTheme = ThemeData(
  primaryColor: ColorThemes.primaryColor,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch(
    accentColor: ColorThemes.primaryColor,
    cardColor: ColorThemes.white,
    errorColor: ColorThemes.red,
  ),
  iconTheme: IconThemeData(
    color: ColorThemes.primaryColor,
    size: 24,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: ColorThemes.black,
  ),
);
