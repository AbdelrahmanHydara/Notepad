import 'package:flutter/material.dart';
import 'package:notepad/shared/constants/constants.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: backgroundColor,
  primaryColor: primaryColor,
  primarySwatch: Colors.deepPurple,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: primaryColor,
    titleTextStyle: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      color: defaultTextColor,
      fontSize: 22,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
  ),
);