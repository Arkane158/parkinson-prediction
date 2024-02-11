import 'package:flutter/material.dart';

class MyTheme {
  static const Color primaryColor = Color(0xff088F8F);
  static const Color unSelctedItem = Color(0xffB1B1B1);

  static final lightTheme = ThemeData(
      primaryColor: primaryColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: primaryColor,
          unselectedItemColor: unSelctedItem,
          selectedIconTheme: IconThemeData(size: 30),
          unselectedIconTheme: IconThemeData(size: 25)),
      appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white, size: 30, weight: 600),
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
      textTheme: const TextTheme(
          headlineSmall: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
          titleLarge: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500)));
}
