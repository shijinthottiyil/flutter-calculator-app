import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ControlContainer extends StatelessWidget {
  const ControlContainer({
    super.key,
    required this.controlText,
    required this.controlColor,
    required this.buttonColor,
  });
  final String controlText;
  final Color controlColor;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 7.h,
      height: 7.h,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(3.w),
      ),
      child: Center(
          child: Text(
        controlText,
        style: TextStyle(
          color: controlColor,
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
      )),
    );
  }
}
