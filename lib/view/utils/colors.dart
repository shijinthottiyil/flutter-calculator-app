import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final toggleProvider =
//     ChangeNotifierProvider<CustomColors>((ref) => CustomColors());

class CustomColors {
  // bool isLight = true;
  static const scaffoldColor = Color(0xff22252D);
  static const toggleColor = Color(0xff292D36);
  static const controlColor = Color(0xff292D36);
  static const buttonColor = Color.fromARGB(255, 32, 35, 41);
  static const btnCtrlGreen = Color(0xff26F3CD);
  static const btnCtrlRed = Color(0xffEC6666);
  static const btnCtrlWhite = Color(0xffffffff);

  static const lightScaffold = Color(0xffffffff);
  static const lighttoggleColor = Color(0xffF9F9F9);
  static const lightButtonColor = Color.fromARGB(255, 235, 234, 234);

  // void themeToggle() {
  //   isLight = !isLight;
  //   notifyListeners();
  // }
}
