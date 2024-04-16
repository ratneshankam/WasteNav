import 'package:flutter/material.dart';
import 'package:test_app/src/utils/theme/text_field_theme.dart';
import 'package:test_app/src/utils/theme/texttheme.dart';

class AppTheme {
  static  ThemeData lightTheme = ThemeData(
     brightness: Brightness.light,
     inputDecorationTheme: TextFormFieldTheme.lightInputDecorationTheme,
     textTheme: TTextTheme.lightTextTheme,
    scaffoldBackgroundColor: Colors.white,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    inputDecorationTheme: TextFormFieldTheme.darkInputDecorationTheme,
    textTheme: TTextTheme.darkTextTheme,
    scaffoldBackgroundColor: Colors.black
    ,
    );
}