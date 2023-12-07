import 'package:chat_app/core/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0.0,
    iconTheme: const IconThemeData(color: AppColor.secondColor),

    titleTextStyle: const TextStyle(
      color: AppColor.secondColor,
      fontSize: 25,
      fontWeight: FontWeight.bold,
      fontFamily: "PlayFairDisplay",
    ), // Cairo

    backgroundColor: Colors.grey.shade50,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.secondColor,
  ),
  fontFamily: "PlayFairDisplay",
  textTheme: const TextTheme(
    // ignore: deprecated_member_use
    headline1: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.secondColor),
    // ignore: deprecated_member_use
    headline2: TextStyle(
        fontSize: 26, fontWeight: FontWeight.bold, color: AppColor.black),
    // ignore: deprecated_member_use
    headline3: TextStyle(fontSize: 18, color: AppColor.black),
    // ignore: deprecated_member_use
    headline4: TextStyle(fontSize: 15,  fontWeight: FontWeight.w500, color: AppColor.blueDark),
    // ignore: deprecated_member_use
    headline5: TextStyle(fontSize: 17, color: AppColor.black),
    // ignore: deprecated_member_use
    headline6: TextStyle(fontSize: 17, color: AppColor.blueDark),
    // ignore: deprecated_member_use
    bodyText1: TextStyle(
      height: 1.5,
      color: AppColor.grey,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    ),
    // ignore: deprecated_member_use
    bodyText2: TextStyle(color: AppColor.grey, fontSize: 15),
  ),
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    // ignore: deprecated_member_use
    headline1: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black),
    // ignore: deprecated_member_use
    headline2: TextStyle(
        fontSize: 26, fontWeight: FontWeight.bold, color: AppColor.black),
    // ignore: deprecated_member_use
    bodyText1: TextStyle(
        height: 1.5,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 15),
    // ignore: deprecated_member_use
    bodyText2: TextStyle(color: AppColor.grey, fontSize: 15),
  ),
);
