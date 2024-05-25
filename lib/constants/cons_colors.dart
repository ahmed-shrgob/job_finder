import 'package:flutter/material.dart';

class AppColor {
  static Gradient gradient = LinearGradient(
    // colors: [Color(0xff8767FF), Color(0xff9275FF), Color(0xffA38BFF)],
    colors: [Color(0xff123456), Color.fromARGB(255, 23, 69, 116), Color.fromARGB(255, 24, 85, 146)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
  // static Color mainColor=Color(0xff8767FF);
  static Color mainColor=Color(0xff123456);
  static Color primaryColor=Colors.cyan;
  // static Color appBarColor=Color(0xffA38BFF);
  static Color appBarColor=Color.fromARGB(255, 24, 85, 146);

}
