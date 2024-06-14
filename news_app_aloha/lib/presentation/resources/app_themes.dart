import 'package:flutter/material.dart';
import 'package:news_app_aloha/presentation/resources/app_colors.dart';
import 'package:news_app_aloha/presentation/resources/app_fonts.dart';

abstract class AppThemes {
  static ThemeData getLightModeTheme() => ThemeData(
        fontFamily: AppFonts.raleway,
        scaffoldBackgroundColor: AppColors.white_b2c2c2,
        appBarTheme: const AppBarTheme(
            elevation: 0,
            surfaceTintColor: AppColors.transparent,
            backgroundColor: AppColors.transparent,
            actionsIconTheme: IconThemeData(
              color: AppColors.green_085e49,
            ),
            iconTheme: IconThemeData(color: AppColors.green_085e49)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.white_b2c2c2,
          selectedItemColor: AppColors.green_085e49,
          unselectedItemColor: AppColors.black_opc40,
          elevation: 30,
        ),
        colorScheme: ColorScheme.light(
          background: AppColors.grey_b6b6c9,
          onBackground: AppColors.black,
          primaryContainer: AppColors.black_opc8,
          surface: AppColors.green_085e49,
          onSurface: AppColors.black_opc20,
          primary: AppColors.white_b2c2c2,
          outline: AppColors.black_opc40,
          onPrimary: AppColors.grey_9b9bbb,
          error: AppColors.red,
          onError: AppColors.brown_55523b,
          tertiary: AppColors.yellow_887B06,
          onSecondary: AppColors.black_opc10,
          shadow: AppColors.black_opc32,
        ),
      );
  //////////////////////////////////////////////////////////////////////////////
  static ThemeData getDarkModeTheme() => ThemeData(
        fontFamily: AppFonts.raleway,
        scaffoldBackgroundColor: AppColors.black_202123,
        appBarTheme: const AppBarTheme(
            elevation: 0,
            surfaceTintColor: AppColors.transparent,
            backgroundColor: AppColors.transparent,
            actionsIconTheme: IconThemeData(
              color: AppColors.green_10A37F,
            ),
            iconTheme: IconThemeData(
              color: AppColors.green_10A37F,
            )),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.black_202123,
          selectedItemColor: AppColors.green_10A37F,
          unselectedItemColor: AppColors.white_opc40,
          elevation: 30,
        ),
        colorScheme: ColorScheme.dark(
          background: AppColors.grey_343541,
          onBackground: AppColors.white,
          primaryContainer: AppColors.white_opc8,
          surface: AppColors.green_10A37F,
          onSurface: AppColors.white_opc20,
          primary: AppColors.black_202123,
          outline: AppColors.white_opc40,
          onPrimary: AppColors.grey_343541,
          error: AppColors.red_ED8C8C,
          onError: AppColors.yellow_FBF3AD,
          tertiary: AppColors.yellow_cdcc12,
          onSecondary: AppColors.white_opc10,
          shadow: AppColors.white_opc32,
        ),
      );
}
