import 'package:flutter/material.dart';

const _primary = Color.fromRGBO(3, 147, 221, 1);
final _primarySwatch = <int, Color>{
  50: const Color.fromRGBO(3, 147, 221, 90),
  100: const Color.fromRGBO(3, 147, 221, .2),
  200: const Color.fromRGBO(3, 147, 221, .3),
  300: const Color.fromRGBO(3, 147, 221, .4),
  400: const Color.fromRGBO(3, 147, 221, .5),
  500: const Color.fromRGBO(3, 147, 221, .6),
  600: const Color.fromRGBO(3, 147, 221, .7),
  700: const Color.fromRGBO(3, 147, 221, .8),
  800: const Color.fromRGBO(3, 147, 221, .9),
  900: const Color.fromRGBO(3, 147, 221, 1),
};
final _primaryMt = MaterialColor(_primary.value, _primarySwatch);
const _fontColor = Colors.grey;

const _bodyFontSize = 16.0;
const _titleFontSize = 24.0;
const _subTitleFontSize = 20.0;

class WarTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: _primary,
      primarySwatch: _primaryMt,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: _fontColor,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: false,
        actionsIconTheme: IconThemeData(color: _fontColor),
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: _primary,
          fontSize: _bodyFontSize,
          height: 1.2,
        ),
        headline1: TextStyle(
          color: Colors.white,
          fontSize: _titleFontSize,
        ),
        headline2: TextStyle(
          fontSize: _subTitleFontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
