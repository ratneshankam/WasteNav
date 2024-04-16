import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';



class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayMedium: TextStyle(color: Colors.black87),
    titleSmall: TextStyle(color: Colors.deepPurple, fontSize: 24),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayMedium: TextStyle(color: Colors.white70),
    titleSmall: TextStyle(color: Colors.white60, fontSize: 24),
  );
}
