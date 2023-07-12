import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeApp {
  static const Color lightPrimary = Color.fromARGB(255, 57, 165, 82);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: Colors.transparent,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ).r,
      ),
    ),
    cardColor: Colors.white,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22.sp,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontSize: 28.sp,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        color: Colors.black,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      color: lightPrimary,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 32.sp,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
        size: 24.sp,
      ),
    ),
  );
}
