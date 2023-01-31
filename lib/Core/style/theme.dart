import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeApp {
  static const Color lightPrimary = Color.fromARGB(255, 57, 165, 82);
  static final ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: Colors.transparent,
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18), topRight: Radius.circular(18)))),
    cardColor: Colors.white,
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
      iconTheme: IconThemeData(color: Colors.white),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );
}
