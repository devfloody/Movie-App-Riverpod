import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'app_fonts.dart';
part 'app_colors.dart';

class MovieTheme {
  static ThemeData get main {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColor.backgroundColor,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColor.surfaceColor,
        foregroundColor: AppColor.primayTextColor,
      ),
      colorSchemeSeed: AppColor.primaryColor,
    );
  }
}
