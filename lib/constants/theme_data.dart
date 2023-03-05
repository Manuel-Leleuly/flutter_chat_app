import 'package:flutter/material.dart';

ThemeData getMyAppThemeData(BuildContext context) => ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.pink,
        backgroundColor: Colors.pink,
      ).copyWith(
        secondary: Colors.deepPurple,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      buttonTheme: ButtonTheme.of(context).copyWith(
        buttonColor: Colors.pink,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
