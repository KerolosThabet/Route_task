import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/colors_manager.dart';


class AppTheme{
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color:  Colors.transparent , elevation: 0
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 18.sp ,fontWeight:FontWeight.w500,color: ColorsManager.headLineColor),
          headlineSmall: TextStyle(fontSize: 16.spMin ,fontWeight:FontWeight.w300,color: ColorsManager.headLineColor)
    )
  );
}