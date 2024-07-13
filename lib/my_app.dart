import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Presentation_layer/Home_Screen.dart';
import 'core/Utils/routes_manager.dart';
import 'core/theme/AppTheme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'e_commerce_route',
        routes: {
          RoutesManager.HomeRouteName:(_)=> HomeScreen(),
        },
        theme:AppTheme.lightTheme ,
        themeMode: ThemeMode.light,
        initialRoute:RoutesManager.HomeRouteName ,
        debugShowCheckedModeBanner: false,

      ),
    );
  }
}
