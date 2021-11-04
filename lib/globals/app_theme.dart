import 'package:flutter/material.dart';

const List<int> colors = [
  0xffEEDD82,
  0xfff032e6,
  0xfffabebe,
  0xff008080,
  0xffe6beff,
  0xff9a6324,
  0xfffffac8,
  0xff800000,
  0xffaaffc3,
  0xff808000,
  0xffffd8b1,
  0xff000075,
  0xff808080,
  // 0xffffffff,
  0xff3cb44b,
  0xff000000,
  0xfff58231,
  0xffe6194b,
  0xff911eb4,
  0xff46f0f0,
  0xffffe119,
  0xff4363d8,
  0xffdd82ee,
  0xffbcf60c,
  0xff1A1A1A,
];

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    bottomAppBarColor: Colors.white,
    //
    scaffoldBackgroundColor: const Color(0xffF6F6F6),
    //
    iconTheme: const IconThemeData(color: Colors.black),
    //
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xffF6F6F6),
      titleTextStyle: TextStyle(color: Colors.white),
      toolbarTextStyle: TextStyle(color: Colors.white),
    ),
    //
    textTheme: const TextTheme(
      button: TextStyle(color: Colors.white),
      headline1: TextStyle(fontFamily: "Sebino"),
    ),
    //
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      colorScheme: ColorScheme(
        primary: Colors.blue,
        primaryVariant: Colors.amberAccent,
        secondary: Colors.redAccent,
        secondaryVariant: Colors.deepPurpleAccent,
        surface: Colors.blue,
        background: Colors.blue,
        error: Colors.redAccent,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onBackground: Colors.white,
        onError: Colors.black,
        brightness: Brightness.light,
      ),
    ),
    //
    colorScheme: const ColorScheme(
      primary: Colors.white,
      primaryVariant: Color(0xff1D212B),
      secondaryVariant: Color(0xff4a4a58),
      background: Color(0xffEBECF0), // Color.fromRGBO(231, 238, 241, 0.938),
      onSurface: Colors.black,
      onPrimary: Colors.black,
      secondary: Colors.grey,
      onSecondary: Colors.white,
      brightness: Brightness.light,
      onError: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      error: Colors.redAccent,
    ),
  );

  static final ThemeData dark = ThemeData(
    iconTheme: const IconThemeData(color: Color(0xff1D212B)),
    //
    scaffoldBackgroundColor: const Color(0xff4a4a58),
    //
    bottomAppBarColor: const Color(0xff4a4a58),
    //
    textTheme: const TextTheme(
      button: TextStyle(color: Colors.white),
      headline1: TextStyle(fontFamily: "Sebino"),
    ),
    //
    colorScheme: const ColorScheme(
      primary: Color(0xff1D212B),
      primaryVariant: Colors.white,
      secondaryVariant: Colors.grey,
      background: Color(0xff4a4a58), // Color.fromRGBO(231, 238, 241, 0.938),
      onSurface: Colors.white,
      onPrimary: Colors.black,
      secondary: Colors.amberAccent,
      onSecondary: Colors.white,
      brightness: Brightness.dark,
      onError: Colors.black,
      onBackground: Colors.white,
      surface: Color(0xff4a4a58),
      error: Colors.redAccent,
    ),
  );
}
