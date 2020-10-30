import 'package:flutter/material.dart';
import 'package:selcapital/constants.dart';

ThemeData theme() {
  return ThemeData(
    appBarTheme: appBarTheme(),
    primaryColor: kPrimaryColor,
    accentColor: kPrimaryColor,
    highlightColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 5,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: kTextColorGrey),
    textTheme: TextTheme(
      headline6: TextStyle(
          color: kTextColorBlue,
          fontFamily: "Poppins",
          fontWeight: FontWeight.bold,
          fontSize: 16),
    ),
  );
}
