import 'package:flutter/material.dart';

import 'app.dart';
import 'colors.dart';

void main() {
  return runApp(
    const MaterialApp(
      home: Duwin(),
    ),
  );
}

ThemeData buildDuwinTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(colorScheme: base.colorScheme.copyWith(
    primary: duwinPink,
    secondary: duwinOrange,
    tertiary: duwinYellow;
  ),);
}
