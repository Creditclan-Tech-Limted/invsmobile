import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF008E90);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF008E90), Color(0xFF008E90)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColorGrey = Color(0xFF9098B1);
const kTextColorWhite = Color(0xFFFFFFFF);
const kTextColorBlue = Color(0xFF223263);
const kTextColorDark = Color(0xFF656D84);
const kStrokeColorDark = Color(0xFFEBF0FF);
const kBackgroundColor = Color(0xFFE5E5E5);
const kSelectedColor = Color(0xFF27AE60);
const kColorBrickRed = Color(0xFF951D2C);
const kColorBrickRedLight = Color(0xFF840B2F);

const kAnimationDuration = Duration(milliseconds: 200);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Email is required";
const String kInvalidEmailError = "Email is invalid";
const String kPassNullError = "Password is required";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords do not match";
const String kBVNNullError = "BVN is required";
const String kBvNShortError = "BVN is not complete";
const String kBvNLongError = "BVN is too long";
const String naira = "\u20A6";

const String kBaseUrl = "https://mobile.creditclan.com/api/v3";
const String kBaseUrlv1 = "https://mobile.creditclan.com/webapi/v1";
const String kApiKey =
    "zf8TVZ31jvXBcJYsUJ7zqITlclne9eiCrHRRAIrGy7Qh9NW6LVX2oaE5xjOdFnUK";
