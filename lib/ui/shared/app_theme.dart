import 'package:flutter/material.dart';

class YPAppTheme {
  // 1.共有属性
  static const double bodyFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 24;
  static const double xlargeFontSize = 30;

  // 2.普通模式
  static final Color norTextColors = Colors.red;

  static final ThemeData norTheme = ThemeData(
      primaryColor: Colors.green,
      primarySwatch: Colors.pink,
      // accentColor: Colors.amber,
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
        color: Colors.redAccent,
        // backgroundColor: Colors.amber,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.redAccent,
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),

      // 设置整个app各个界面的背景色
      // canvasColor: const Color.fromRGBO(255, 254, 222, 1),//改变tabbar的背景色
      scaffoldBackgroundColor: const Color.fromRGBO(255, 254, 222, 1),
      textTheme: const TextTheme(
        bodySmall: TextStyle(fontSize: bodyFontSize),
        displaySmall: TextStyle(fontSize: smallFontSize, color: Colors.black87),
        displayMedium: TextStyle(fontSize: normalFontSize, color: Colors.black87),
        displayLarge: TextStyle(fontSize: largeFontSize, color: Colors.black87),
        labelLarge: TextStyle(fontSize: xlargeFontSize, color: Colors.black87, fontWeight: FontWeight.w400),
      )
  );

  // 3.暗黑模式
  static const Color darkTextColors = Colors.green;

  static final ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      textTheme: const TextTheme(
          bodySmall: TextStyle(fontSize: normalFontSize, color: darkTextColors)
      )
  );
}

class GlobalThemData {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);
  static ThemeData lightThemeData =
  themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);
  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
        colorScheme: colorScheme,
        canvasColor: colorScheme.background,
        scaffoldBackgroundColor: colorScheme.background,
        highlightColor: Colors.transparent,
        focusColor: focusColor
    );
  }
  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFB93C5D),
    onPrimary: Colors.black,
    secondary: Color(0xFFEFF3F3),
    onSecondary: Color(0xFF322942),
    error: Colors.redAccent,
    onError: Colors.white,
    background: Color(0xFFE6EBEB),
    onBackground: Colors.white,
    surface: Color(0xFFFAFBFB),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );
  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFF8383),
    secondary: Color(0xFF4D1F7C),
    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    onBackground: Color(0x0DFFFFFF),
    error: Colors.redAccent,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    brightness: Brightness.dark,
  );
}