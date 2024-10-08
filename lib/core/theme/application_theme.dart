import 'package:flutter/material.dart';

class ApplicationThemeManager {
  static Color primaryColor = const Color(0xffB7935F);
  static Color primaryDarkColor = const Color(0xffFACC1D);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
            fontFamily: "ElMessiri",
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xff242424))),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff242424),
        selectedIconTheme:
            const IconThemeData(color: Color(0xff242424), size: 35),
        unselectedIconTheme:
            const IconThemeData(color: Color(0xffffffff), size: 28),
        unselectedItemColor: const Color(0xff242424),
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(fontSize: 12)),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontFamily: "ElMessiri",
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Color(0xff242424)),
      bodyLarge: TextStyle(
          fontWeight: FontWeight.w500,
          color: Color(0xff242424),
          fontSize: 25,
          fontFamily: "ElMessiri"),
      bodyMedium: TextStyle(
          fontFamily: "ElMessiri",
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: Color(0xff242424)),
      bodySmall: TextStyle(
          fontFamily: "ElMessiri",
          fontSize: 20,
          // fontWeight: FontWeight.w500,
          color: Color(0xff242424)),
    ),
    dividerTheme: DividerThemeData(color: primaryColor, thickness: 3),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryDarkColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
          fontFamily: "ElMessiri",
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Color(0xffffffff)),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: const Color(0xff141A2E),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryDarkColor,
        selectedIconTheme: IconThemeData(color: primaryDarkColor, size: 35),
        unselectedIconTheme:
            const IconThemeData(color: Color(0xffffffff), size: 28),
        unselectedItemColor: const Color(0xffffffff),
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(fontSize: 12)),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontFamily: "ElMessiri",
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: primaryDarkColor),
      bodyLarge: TextStyle(
          fontWeight: FontWeight.w500,
          color: primaryDarkColor,
          fontSize: 25,
          fontFamily: "ElMessiri"),
      bodyMedium: TextStyle(
          fontFamily: "ElMessiri",
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: primaryDarkColor),
      bodySmall: TextStyle(
          fontFamily: "ElMessiri",
          fontSize: 20,
          // fontWeight: FontWeight.w500,
          color: primaryDarkColor),
    ),
    dividerTheme: DividerThemeData(color: primaryDarkColor, thickness: 3),
  );
}
