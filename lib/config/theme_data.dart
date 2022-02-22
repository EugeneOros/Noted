import 'package:flutter/material.dart';

// import 'package:google_fonts/google_fonts.dart';
import 'package:utopia_recruitment_task/config/colors.dart';
import 'package:utopia_recruitment_task/utils/style.dart';

ThemeData getThemeData() {
  return ThemeData(
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
        foregroundColor: null,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
        elevation: MaterialStateProperty.resolveWith(getElevation),
        backgroundColor: MaterialStateProperty.resolveWith(getColor),
      ),
    ),
    colorScheme: ColorScheme(
      background: lightColor,
      onBackground: darkColor,
      brightness: Brightness.light,
      error: errorColor,
      onError: Colors.white,
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: secondaryColor,
      onSecondary: Color(0xffa55a96),
      surface: Colors.white,
      onSurface: Color(0xff777b89),
      primaryVariant: Color(0xff6c60ff),
      secondaryVariant: Color(0xffc997f8),
    ),
    textTheme: TextTheme(
      button: TextStyle(fontSize: 18, overflow: TextOverflow.ellipsis, fontWeight: FontWeight.w500, color: Colors.white),
      headline1: TextStyle(fontSize: 40, overflow: TextOverflow.ellipsis, fontWeight: FontWeight.w300, color: darkColor),
      bodyText1: TextStyle(fontSize: 23, overflow: TextOverflow.fade, fontWeight: FontWeight.w300, color: darkColor),
      subtitle1: TextStyle(fontSize: 17, overflow: TextOverflow.fade, fontWeight: FontWeight.w400, color: greyColor),
      subtitle2: TextStyle(fontSize: 14, overflow: TextOverflow.fade, fontWeight: FontWeight.w400, color: greyColor),
    ),
    iconTheme: const IconThemeData(
      color: darkColor,
      size: 30,
    ),
  );
}
