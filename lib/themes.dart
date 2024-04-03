import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class MyTheme {
  static CupertinoThemeData themeData = CupertinoThemeData(
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(
        color: CupertinoColors.label,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        fontFamily: GoogleFonts.dmSans().fontFamily,
        decoration: TextDecoration.none    
      )
    )
  );

  static TextStyle headline(CupertinoThemeData themeData) =>
    themeData.textTheme.textStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold
    );

  static TextStyle minorText(CupertinoThemeData themeData) =>
    themeData.textTheme.textStyle.copyWith(
      color: const Color.fromRGBO(128, 128, 128, 1),
    );

  static TextStyle headlineName(CupertinoThemeData themeData) =>
    themeData.textTheme.textStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold
    );
  
  static TextStyle cardTitleText(CupertinoThemeData themeData) =>
    themeData.textTheme.textStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold
    );

  static TextStyle cardCategoryText(CupertinoThemeData themeData) =>
    themeData.textTheme.textStyle.copyWith(
      color: const Color.fromRGBO(255, 255, 255, 0.9)
    );

  static TextStyle cardDescriptionText(CupertinoThemeData themeData) =>
    themeData.textTheme.textStyle.copyWith(
      color: const Color.fromRGBO(0, 0, 0, 0.9)
    );

  static TextStyle detailsTitleText(CupertinoThemeData themeData) =>
    themeData.textTheme.textStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.bold
    );

  static TextStyle detailsPreferredCategoryText(CupertinoThemeData themeData) =>
    themeData.textTheme.textStyle.copyWith(
      fontWeight: FontWeight.bold
    );

  static TextStyle detailsBoldDescriptionText(CupertinoThemeData themeData) =>
    themeData.textTheme.textStyle.copyWith(
      color: const Color.fromRGBO(0, 0, 0, 0.9)
    );

  static TextStyle detailsServingHeaderText(CupertinoThemeData themeData) =>
    themeData.textTheme.textStyle.copyWith(
      color: const Color.fromRGBO(176, 176, 176, 0.9),
      fontWeight: FontWeight.bold
    );

  static TextStyle detailsServingLableText(CupertinoThemeData themeData) =>
    themeData.textTheme.textStyle.copyWith(
      color: const Color.fromRGBO(176, 176, 176, 0.9),
      fontWeight: FontWeight.bold
    );

  static TextStyle detailsServingNoteText(CupertinoThemeData themeData) =>
    themeData.textTheme.textStyle.copyWith(
      color: const Color.fromRGBO(176, 176, 176, 0.9),
      fontStyle: FontStyle.italic
    );

  static TextStyle trivaFinishedTitleText(CupertinoThemeData themeData) =>
    themeData.textTheme.textStyle.copyWith(
      fontSize: 32
    );

  static TextStyle trivaFinishedBigText(CupertinoThemeData themeData) =>
    themeData.textTheme.textStyle.copyWith(
      fontSize: 48
    );

  //static TextStyle settingsGroupFooterText(CupertinoThemeData themeData) =>
  //  themeData.textTheme.textStyle.copyWith(
  //    color: MyTheme.settingsGroupSubtitle,
  //    fontSize: 13,
  //    letterSpacing: -0.08
  //  );

  static Color? scaffoldBackground(Brightness brightness) =>
    brightness == Brightness.light
        ? CupertinoColors.lightBackgroundGray
        : null;

  static const frostedBackground = Color(0xccf8f8f8);

  static const closeButtonUnpressed = Color(0xff101010);

  static const closeButtonPressed = Color(0xff808080);

  static TextStyle settingsItemSubtitleText(CupertinoThemeData themeData) =>
    themeData.textTheme.textStyle.copyWith(
      fontSize: 12,
      letterSpacing: -0.2,
    );

  static const searchCursorColor = Color.fromRGBO(0, 122, 255, 1);

  static const searchIconColor = Color.fromRGBO(128, 128, 128, 1);

}
