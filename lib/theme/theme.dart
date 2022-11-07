import 'package:flutter/material.dart';

const _primary = Color.fromRGBO(156, 39, 176, 1);
final _primarySwatch = <int, Color>{
  50: const Color.fromRGBO(156, 39, 176, 90),
  100: const Color.fromRGBO(156, 39, 176, .2),
  200: const Color.fromRGBO(156, 39, 176, .3),
  300: const Color.fromRGBO(156, 39, 176, .4),
  400: const Color.fromRGBO(156, 39, 176, .5),
  500: const Color.fromRGBO(156, 39, 176, .6),
  600: const Color.fromRGBO(156, 39, 176, .7),
  700: const Color.fromRGBO(156, 39, 176, .8),
  800: const Color.fromRGBO(156, 39, 176, .9),
  900: const Color.fromRGBO(156, 39, 176, 1),
};
final _primaryMt = MaterialColor(_primary.value, _primarySwatch);
const _fontColor = Colors.grey;

const _bodyFontSize = 16.0;
const _titleFontSize = 24.0;

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
        headline1: TextStyle(color: Colors.white, fontSize: _titleFontSize),
      ),
    );
  }
}
