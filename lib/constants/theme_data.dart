import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/constants/font_constants.dart';
import 'package:sizer/sizer.dart';

ThemeData getAppThemeData() {
  return ThemeData(
    primaryColor: ColorConstants.white,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: ColorConstants.orange,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorConstants.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: ColorConstants.transparent,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorConstants.orange,
      selectionColor: Colors.green,
      selectionHandleColor: Colors.blue,
    ), // bottomAppBarColor: ColorConstants.appBlack,
    fontFamily: Fonts.ProximaNovaRegular,
    // shadowColor: ColorConstants.shadowColor,
    // focusColor: ColorConstants.appBlack,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: ColorConstants.black,
        fontSize: 11.5.sp,
        fontFamily: Fonts.ProximaNovaRegular,
      ),
      hintStyle: TextStyle(
        color: ColorConstants.black,
        fontSize: 11.sp,
        //fontWeight: FontWeight.bold,
      ),
      focusColor: ColorConstants.orange,
      filled: true,
      fillColor: ColorConstants.orange.withOpacity(0.1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3.w),
        borderSide: BorderSide.none,
        //gapPadding: 5,
      ),
      //contentPadding: EdgeInsets.all(3.w),
    ),
    //
    // tabBarTheme: TabBarTheme(
    //   unselectedLabelColor: ColorConstants.unSelectedWidgetColor,
    //   labelColor: ColorConstants.appBlue,
    //   indicatorSize: TabBarIndicatorSize.tab,
    //   labelPadding: EdgeInsets.only(bottom: 1.0.w, left: 3.5.w, right: 3.5.w),
    //   indicator: BoxDecoration(
    //       border: Border(
    //           bottom: BorderSide(width: 0.8.w, color: ColorConstants.appBlue))),
    //   unselectedLabelStyle: TextStyle(
    //     fontSize: 14.5.sp,
    //     fontFamily: FontConstants.sourceSansProLight,
    //   ),
    //   labelStyle: TextStyle(
    //     fontSize: 14.5.sp,
    //     color: ColorConstants.appBlue,
    //     fontFamily: FontConstants.sourceSansProLight,
    //   ),
    // ),
    //
    // /// Outlined Button Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: ColorConstants.orange, width: 1),
        primary: ColorConstants.orange,
        padding: EdgeInsets.symmetric(vertical: 2.h),
        minimumSize: Size(44.w, 2.5.h),
      ),
    ),
    //
    // /// Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: ColorConstants.orange,
        padding: EdgeInsets.symmetric(vertical: 2.h),
        minimumSize: Size(44.w, 2.5.h),
      ),
    ),
    //
    // /// Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: ColorConstants.orange,
        padding: EdgeInsets.zero,
        textStyle: TextStyle(
          fontSize: 11.0.sp,
          fontFamily: Fonts.ProximaNovaBold,
        ),
      ),
    ),
    //
    // /// Icon Button Theme
    // iconTheme: const IconThemeData(
    //   color: ColorConstants.appBlack,
    // ),

    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 26.0.sp,
        letterSpacing: -0.5,
        fontFamily: Fonts.ProximaNovaBold,
        color: ColorConstants.white,
      ),
      headline2: TextStyle(
        fontSize: 23.0.sp,
        letterSpacing: -0.5,
        fontFamily: Fonts.ProximaNovaBold,
        color: ColorConstants.orange,
      ),

      //     headline4: TextStyle(
      //       fontSize: 13.0.sp,
      //       fontFamily: FontConstants.sourceSansProBold,
      //       color: ColorConstants.appBlack,
      //     ),
      headline5: TextStyle(
        fontSize: 14.sp,

        ///Medium changed with Light
        fontFamily: Fonts.ProximaNovaBold,
        color: ColorConstants.black,
      ),
      headline6: TextStyle(
        fontSize: 12.sp,

        ///Medium changed with Light
        fontFamily: Fonts.ProximaNovaBold,
        color: ColorConstants.black,
      ),
    ),
    //
    //     /// This style automatically applies on all the [Text]
    //     bodyText2: TextStyle(
    //       fontSize: 11.sp,
    //       fontWeight: FontWeight.w300,
    //       fontFamily: FontConstants.sourceSansProRegular,
    //       color: ColorConstants.grayLevel2,
    //     ),
    //
    //     /// Using this style for radio button text and other place with 16.0.sp and #0d1111 color
    //     bodyText1: TextStyle(
    //       fontSize: 13.0.sp,
    //       fontFamily: FontConstants.sourceSansProRegular,
    //       color: ColorConstants.appBlack,
    //     ),
    //
    //     /// This style automatically applies on the text of [ElevatedButton, OutlinedButton]
    //     /// also we can define different text style for these button in there respective
    //     /// theme data above
    //     button: TextStyle(
    //       fontSize: 13.0.sp,
    //       fontFamily: FontConstants.sourceSansProSemiBold,
    //       color: Colors.white,
    //     ),
    //
    //     //text size semiBold black
    //     headline6: TextStyle(
    //       fontSize: 13.sp,
    //       fontFamily: FontConstants.sourceSansProSemiBold,
    //       color: ColorConstants.appBlack,
    //     ),
    //   ),
  );
}

class FontConstants {}
