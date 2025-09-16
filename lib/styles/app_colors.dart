import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color clearWhite = Color(0XFFFFFFFF);
  static const Gradient white = LinearGradient(
    colors: [Color(0XFFFFFFFF), Color.fromARGB(0, 255, 255, 255)],
  );
  static const Color page = Color(0XFFE5E5E5);
  static const Gradient blue = LinearGradient(
    colors: [Color(0XFF3C6FD1), Color(0XFF3C6FD1), Color(0XFF7CA9FF)],
  );
  static const Gradient darkBlue = LinearGradient(
    colors: [Color(0XFF0C386C), Color(0XFF294F97)],
  );
  static const Color secondDark = Color(0XFFA098AE);
  static const Color dark = Color(0XFF363B64);
}
