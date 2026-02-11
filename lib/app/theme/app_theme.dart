import 'package:flutter/material.dart';
import 'package:to_do_task/core/constant/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme=ThemeData(
    useMaterial3: true,
    colorScheme:ColorScheme.fromSeed(

      seedColor:AppColors.seed,
      surface: Colors.white,
      onSurface: Colors.black,   ///
      onPrimaryContainer: Colors.white,  ///

    ),
  );

  static ThemeData darkTheme=ThemeData(
    colorScheme: ColorScheme.fromSeed(

      seedColor:AppColors.seed,
      surface: Colors.black,
      onSurface: Colors.white,    ///
      onPrimaryContainer: AppColors.containerDark, ///

    )
  );
}