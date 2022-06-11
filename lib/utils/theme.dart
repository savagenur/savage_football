import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF00D2BF);
const Color darkGreyClr = Color(0xFF344B47);
const Color greyClr = Colors.grey;
const Color whiteClr = Colors.white;
const greenClr = Color(0xFF498536);
const Color blackClr = Color.fromARGB(255, 26, 38, 35);
Color darkHeaderClr = Color(0xFF424242);

class Themes {
  static final light = ThemeData(
    backgroundColor: Colors.white,
    tabBarTheme: TabBarTheme(
        labelStyle: TextStyle(color: blackClr, fontSize: 10),
        labelColor: blackClr,
        unselectedLabelColor: greyClr,
        labelPadding: EdgeInsets.all(0)),
    brightness: Brightness.light,
    textTheme: TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: blackClr,
      displayColor: Colors.blue,
    ),
  ).copyWith(
    
    appBarTheme: const AppBarTheme(
        backgroundColor: whiteClr,
        titleTextStyle: TextStyle(
          color: blackClr,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: blackClr)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: greenClr, unselectedItemColor: greyClr),
  );

  static final dark = ThemeData(
    backgroundColor: greenClr,
    brightness: Brightness.dark,
  ).copyWith(
    appBarTheme: AppBarTheme(backgroundColor: darkHeaderClr),
  );
}

TextStyle get subHeadingStyle {
  return TextStyle(
          fontSize: 15, fontWeight: FontWeight.w500, color: blackClr);
}

TextStyle get headingStyle {
  return TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);
}

TextStyle get titleStyle {
  return TextStyle(
          fontSize: 13, fontWeight: FontWeight.w500, color: blackClr);
}

TextStyle get subTitleStyle {
  return TextStyle(
          fontSize: 11, fontWeight: FontWeight.w200, color: Colors.grey);
}
