import 'package:flutter/material.dart';

class TextFormFieldTheme{
  TextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = 
   InputDecorationTheme(
 border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(100),
 ),
 prefixIconColor: Colors.black,
 suffixIconColor: Colors.black,
 floatingLabelStyle: const TextStyle(
  color: Colors.black,
 ),
 focusedBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(100),
  borderSide: const BorderSide(
    width: 2,
    color: Colors.black,
  ),
 )

  );

  static InputDecorationTheme darkInputDecorationTheme = 
  InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
    ),
    prefixIconColor: Colors.green,
    suffixIconColor: Colors.green,
    floatingLabelStyle: const TextStyle(
      color: Colors.green),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(
          width: 2,
          color: Colors.green
        )
      )
  );
}