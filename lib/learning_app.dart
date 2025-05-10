import 'package:flutter/material.dart';
import 'package:learning_app/core/utils/constant/app_router.dart';
import 'package:learning_app/core/utils/constant/colors.dart';

class LearningApp extends StatelessWidget {
  const LearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.routes,
      themeMode: ThemeMode.light,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: MColors.light,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: Colors.black),
          titleLarge: TextStyle(color: Colors.black),
          titleMedium: TextStyle(color: Colors.black),

          titleSmall: TextStyle(color: Colors.black),
          displayLarge: TextStyle(color: Colors.black),
          displayMedium: TextStyle(color: Colors.black),
          displaySmall: TextStyle(color: Colors.black),
          headlineLarge: TextStyle(color: Colors.black),
          headlineMedium: TextStyle(color: Colors.black),

          headlineSmall: TextStyle(color: Colors.black),
          labelLarge: TextStyle(color: Colors.black),
          labelMedium: TextStyle(color: Colors.black),
          labelSmall: TextStyle(color: Colors.black),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: MColors.secondary,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      // darkTheme: ThemeData.dark().copyWith(
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: MColors.primary,
        textTheme: const TextTheme(
          // Setting default text color to white for dark theme
          // bodyLarge: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
          titleMedium: TextStyle(color: Colors.white),
          titleSmall: TextStyle(color: Colors.white),
          displayLarge: TextStyle(color: Colors.white),
          displayMedium: TextStyle(color: Colors.white),
          displaySmall: TextStyle(color: Colors.white),
          headlineLarge: TextStyle(color: Colors.white),
          headlineMedium: TextStyle(color: Colors.white),
          headlineSmall: TextStyle(color: Colors.white),
          labelLarge: TextStyle(color: Colors.white),
          labelMedium: TextStyle(color: Colors.white),
          labelSmall: TextStyle(color: Colors.white),

          // Setting default text color to white for dark theme,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: MColors.secondary,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
