import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      accentColor: Color(0xFFd21522),
      backgroundColor: Color(0xFFf9f9fd),
      primarySwatch: Colors.red,
    ),
    primaryColor: Color(0xFFd21522),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xFFd21522),
      foregroundColor: Colors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
      foregroundColor: Color(0xFFd21522),
      elevation: 2,
      shape: StadiumBorder(),
    ),
    useMaterial3: true,
  );
}
