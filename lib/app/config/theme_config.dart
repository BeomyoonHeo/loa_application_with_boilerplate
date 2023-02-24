import 'package:flutter/material.dart';

class ThemeConfig {
  final _theme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
  static ThemeData get basicTheme => ThemeConfig()._theme;
}
