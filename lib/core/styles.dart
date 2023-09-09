import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xff1A77FF);
  static const Color secondary = Color(0xffFFBB05);
  static const Color accent = Color(0xffF5C3D2);
  static const Color border = Color(0xff505254);
  static const Color danger = Color(0xffF70000);
  static const Color success = Color(0xff04B616);
  static const Color black = Color(0xff1A1A1A);
  static const Color onBlack = Color(0xff353535);
  static const Color onWhite = Color(0xffEBEBEB);
  static const Color white = Color(0xffF2F2F2);
}

class AppBorderRadius {
  static const double sm = 5;
  static const double md = 10;
  static const double lg = 15;
  static const double xl = 20;
  static const double xxl = 25;
}

class AppThemes {
  static ThemeData getTheme({bool isDark = true}) {
    return ThemeData(
      fontFamily: 'Raleway',
      scaffoldBackgroundColor: AppColors.black,
      dividerColor: AppColors.border,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        background: AppColors.black,
        onBackground: AppColors.onBlack,
        shadow: AppColors.black,
      ),
      splashFactory: NoSplash.splashFactory,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        indicatorColor: Colors.transparent,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          fixedSize: const Size.fromHeight(50),
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 0, color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 0, color: AppColors.border),
          ),
          fillColor: AppColors.black,
        ),
        menuStyle: MenuStyle(
          backgroundColor:
          const MaterialStatePropertyAll<Color>(AppColors.black),
          elevation: const MaterialStatePropertyAll<double>(0),
          shape: MaterialStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              side: const BorderSide(color: AppColors.border),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 0, color: Colors.transparent),
        ),
        fillColor: AppColors.black,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 0, color: AppColors.border),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 0, color: AppColors.border),
        ),
      ),
    );
  }

  static ThemeData get darkTheme => getTheme();
}
