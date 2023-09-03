import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFFCE0E9),
  100: Color(0xFFF7B3C8),
  200: Color(0xFFF280A3),
  300: Color(0xFFEC4D7E),
  400: Color(0xFFE82662),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFFE1003F),
  700: Color(0xFFDD0037),
  800: Color(0xFFD9002F),
  900: Color(0xFFD10020),
});
const int _primaryPrimaryValue = 0xFFE40046;

const MaterialColor primaryAccent =
    MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFFFF9FA),
  200: Color(_primaryAccentValue),
  400: Color(0xFFFF939D),
  700: Color(0xFFFF7A86),
});
const int _primaryAccentValue = 0xFFFFC6CB;

const MaterialColor primary2 =
    MaterialColor(_primary2PrimaryValue, <int, Color>{
  50: Color(0xFFF5F0EA),
  100: Color(0xFFE5DACB),
  200: Color(0xFFD4C1A8),
  300: Color(0xFFC3A885),
  400: Color(0xFFB6966B),
  500: Color(_primary2PrimaryValue),
  600: Color(0xFFA27B4A),
  700: Color(0xFF987040),
  800: Color(0xFF8F6637),
  900: Color(0xFF7E5327),
});
const int _primary2PrimaryValue = 0xFFA98351;

const MaterialColor primary2Accent =
    MaterialColor(_primary2AccentValue, <int, Color>{
  100: Color(0xFFFFDFC1),
  200: Color(_primary2AccentValue),
  400: Color(0xFFFFAA5B),
  700: Color(0xFFFF9D41),
});
const int _primary2AccentValue = 0xFFFFC58E;
