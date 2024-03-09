import 'package:flutter/material.dart';

class AppColors {
  static const Color kprimary100 = Colors.black12;
  static const Color kprimary200 = Colors.black26;
  static const Color kprimary300 = Colors.black38;
  static const Color kprimary400 = Colors.black45;
  static const Color kprimary500 = Colors.black54;
  static const Color kprimary600 = Colors.black87;

  static const Color ksecondary100 = Colors.white10;
  static const Color ksecondary200 = Colors.white12;
  static const Color ksecondary300 = Colors.white24;
  static const Color ksecondary400 = Colors.white30;
  static const Color ksecondary500 = Colors.white38;
  static const Color ksecondary600 = Colors.white54;

  static const Color kerror = Colors.red;
  static const Color ksuccess = Colors.green;
  static const Color kwarning = Colors.yellowAccent;

  static const Color kOtherBlue = Colors.lightBlueAccent;
  static const Color kOtherPurple = Colors.deepPurpleAccent;

  static const kGradient = LinearGradient(
    colors: [kOtherPurple, ksecondary500],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
