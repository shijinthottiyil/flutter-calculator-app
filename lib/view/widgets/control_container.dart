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
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.5),
        //     spreadRadius: 0,
        //     blurRadius: 3,
        //     offset: Offset(2,
        //         3), // changes the shadow direction horizontally and vertically
        //   ),
        // ],
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
