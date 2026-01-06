import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF2563EB),

  // light mode base container background
  scaffoldBackgroundColor: Color(0xFFF9FAFB),

  // light mode card background
  cardColor: Colors.white,

  // app-bar theme leading-icon, action-icons, and text on light mode
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(color: Colors.black87, size: 34),
    titleTextStyle: TextStyle(color: Colors.black87, fontSize: 30, fontWeight: FontWeight.w600),
    elevation: 0,
  ),

  // input decoration theme
  inputDecorationTheme: InputDecorationTheme(
    border: InputBorder.none,
    hintStyle: TextStyle(color: Colors.grey[500]),
  ),

  // light mode text theme
  textTheme: const TextTheme(
    // title compose and title tile
    titleLarge: TextStyle(fontSize: 27, fontWeight: FontWeight.w600, color: Colors.black87),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),

    // content compose and content tile
    bodyLarge: TextStyle(fontSize: 20, color: Colors.black87),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),

    // label on primary button
    labelSmall: TextStyle(color: Color(0xFF2563EB), fontSize: 12, fontWeight: FontWeight.w500),
  ),

  // light mode bottom-app-bar background, icon and text inside bottom-app bar uses primary color
  bottomAppBarTheme: BottomAppBarThemeData(color: Colors.white, elevation: 1),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFF2563EB),

  // dark mode base container background (scaffold)
  scaffoldBackgroundColor: const Color(0xFF1F2937),

  // dark mode card background
  cardColor: const Color(0xFF374151),

  // app-bar theme for dark mode
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white70, size: 34), // leading icons
    actionsIconTheme: IconThemeData(color: Color(0xFF2563EB), size: 34), // action icons still primary blue
    titleTextStyle: TextStyle(
      color: Colors.white70,
      fontSize: 30,
      fontWeight: FontWeight.w600,
    ),
    elevation: 0,
    backgroundColor: Color(0xFF1F2937),
  ),

  // input decoration theme
  inputDecorationTheme: InputDecorationTheme(
    border: InputBorder.none,
    hintStyle: TextStyle(color: Colors.grey[400]),
  ),

  // text theme for dark mode
  textTheme: const TextTheme(
    // title compose and title tile
    titleLarge: TextStyle(fontSize: 27, fontWeight: FontWeight.w600, color: Colors.white70),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white70),

    // content compose and content tile
    bodyLarge: TextStyle(fontSize: 20, color: Colors.white70),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),

    // label on primary button
    labelSmall: TextStyle(color: Color(0xFF2563EB), fontSize: 12, fontWeight: FontWeight.w500),
  ),

  // dark mode bottom-app-bar
  bottomAppBarTheme: const BottomAppBarThemeData(
    color: Color(0xFF111827), // very dark gray for bottom app bar
    elevation: 1,
  ),

  // icon theme for general icons outside appbar
  iconTheme: const IconThemeData(
    color: Colors.white70,
    size: 24,
  ),
);