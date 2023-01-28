import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeApp {
  static const Color lightPrimary = Color.fromARGB(255, 57, 165, 82);

  static const Color darkPrimary = Color.fromARGB(255, 20, 26, 46);
  static const Color yellow = Color.fromARGB(255, 250, 204, 29);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: Colors.transparent,
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18), topRight: Radius.circular(18)))),
    cardColor: Colors.white,
    accentColor: lightPrimary,
    textTheme: const TextTheme(
        headline6: TextStyle(
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        headline4: TextStyle(
          fontSize: 28,
          color: Colors.black,
        ),
        subtitle2: TextStyle(fontSize: 14, color: Colors.black)),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      color: lightPrimary,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 32, fontWeight: FontWeight.w500),
      iconTheme: IconThemeData(color: Colors.black),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(size: 36, color: Colors.black),
        unselectedIconTheme: IconThemeData(size: 30, color: Colors.white),
        selectedLabelStyle: TextStyle(color: Colors.black),
        selectedItemColor: Colors.black),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: darkPrimary,
    accentColor: yellow,
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: darkPrimary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18), topRight: Radius.circular(18)))),
    textTheme: const TextTheme(
        headline6: TextStyle(
          fontSize: 22,
          color: Colors.white,
        ),
        headline4: TextStyle(
          fontSize: 28,
          color: Colors.white,
        ),
        subtitle2: TextStyle(fontSize: 14, color: Colors.white)),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 32, fontWeight: FontWeight.w500),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(size: 36, color: yellow),
        unselectedIconTheme: IconThemeData(size: 30, color: Colors.white),
        selectedLabelStyle: TextStyle(color: yellow),
        selectedItemColor: yellow),
  );
}
