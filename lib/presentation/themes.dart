import 'package:flutter/material.dart';

class ApplicationTheme{
  static ThemeData get lightTheme{
    return ThemeData(
      primaryColor: Colors.red,
      scaffoldBackgroundColor: Colors.grey.shade100,
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 18, color: Colors.grey.shade800)
      )
    );
  }
}