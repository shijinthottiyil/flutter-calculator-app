import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:my_calculator/view/utils/colors.dart';
import 'package:my_calculator/view/widgets/button_widget.dart';
import 'package:my_calculator/view/widgets/control_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final player = AudioPlayer();
  final FocusNode _focusNode = FocusNode();
  var num1 = TextEditingController(text: "0");
  var oper = TextEditingController(text: "");
  var answerText = TextEditingController(text: "");
  bool isLight = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isLight ? CustomColors.lightScaffold : CustomColors.scaffoldColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 5.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                    color: isLight
                        ? CustomColors.lighttoggleColor
                        : CustomColors.toggleColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isLight = true;
                        });
                      },
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: Icon(
                        Icons.wb_sunny,
                        color: isLight ? Colors.black : Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isLight = false;
                        });
                      },
                      icon: Icon(Icons.dark_mode,
                          color: isLight
                              ? Colors.grey.withOpacity(0.5)
                              : Colors.white),
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                    ),
                  ]),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                padding: EdgeInsets.only(left: 3.h, right: 3.h),
                width: double.infinity,
                height: double.infinity,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration.collapsed(
                          hintText: "",
                        ),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: isLight ? Colors.black : Colors.white,
                          fontSize: 35.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        focusNode: _focusNode,
                        onTap: () {
                          _focusNode.unfocus();
                          _focusNode.canRequestFocus = false;
                        },
                        controller: num1,
                      ),
                      TextFormField(
                        decoration: const InputDecoration.collapsed(
                          hintText: "",
                        ),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: isLight ? Colors.black : Colors.white,
                          fontSize: 50.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        focusNode: _focusNode,
                        onTap: () {
                          _focusNode.unfocus();
                          _focusNode.canRequestFocus = false;
                        },
                        controller: answerText,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 70.h,
                  decoration: BoxDecoration(
                    color: isLight
                        ? CustomColors.lighttoggleColor
                        : CustomColors.controlColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.h),
                      topRight: isLight
                          ? Radius.circular(4.h)
                          : Radius.circular(70.h),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(3.5.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await player.play(
                                  AssetSource('iphone_sound_trim.mp3'),
                                  volume: 0.2,
                                );
                                setState(() {
                                  num1.text = "0";
                                });
                                answerText.clear();
                              },
                              child: ControlContainer(
                                buttonColor: isLight
                                    ? CustomColors.lightButtonColor
                                    : CustomColors.buttonColor,
                                controlText: "AC",
                                controlColor: CustomColors.btnCtrlGreen,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await player.play(
                                  AssetSource('iphone_sound_trim.mp3'),
                                  volume: 0.2,
                                );
                                if (num1.text == "0") {
                                  return;
                                } else {
                                  setState(() {
                                    if (num1.text.length != 1) {
                                      num1.text = num1.text
                                          .substring(0, num1.text.length - 1);
                                    } else {
                                      num1.text = "0";
                                    }
                                  });
                                }
                              },
                              child: ControlContainer(
                                buttonColor: isLight
                                    ? CustomColors.lightButtonColor
                                    : CustomColors.buttonColor,
                                controlText: "⌫",
                                controlColor: CustomColors.btnCtrlGreen,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await player.play(
                                  AssetSource('iphone_sound_trim.mp3'),
                                  volume: 0.2,
                                );
                                oper.text = "%";
                                num number = num.parse(num1.text);
                                num result = number / 100;
                                setState(() {
                                  answerText.text = result.toString();
                                  num1.clear();
                                });
                              },
                              child: ControlContainer(
                                buttonColor: isLight
                                    ? CustomColors.lightButtonColor
                                    : CustomColors.buttonColor,
                                controlText: "%",
                                controlColor: CustomColors.btnCtrlGreen,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await player.play(
                                  AssetSource('iphone_sound_trim.mp3'),
                                  volume: 0.2,
                                );
                                setState(() {
                                  oper.text = "÷";
                                  num1.text = "(${num1.text})/";
                                });
                              },
                              child: ControlContainer(
                                  buttonColor: isLight
                                      ? CustomColors.lightButtonColor
                                      : CustomColors.buttonColor,
                                  controlText: "÷",
                                  controlColor: CustomColors.btnCtrlRed),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonWidget(
                              buttonColor: isLight
                                  ? CustomColors.lightButtonColor
                                  : CustomColors.buttonColor,
                              controlText: "7",
                              controlColor: isLight
                                  ? Colors.black
                                  : CustomColors.btnCtrlWhite,
                              num1: num1,
                            ),
                            ButtonWidget(
                              buttonColor: isLight
                                  ? CustomColors.lightButtonColor
                                  : CustomColors.buttonColor,
                              controlText: "8",
                              controlColor: isLight
                                  ? Colors.black
                                  : CustomColors.btnCtrlWhite,
                              num1: num1,
                            ),
                            ButtonWidget(
                              buttonColor: isLight
                                  ? CustomColors.lightButtonColor
                                  : CustomColors.buttonColor,
                              controlText: "9",
                              controlColor: isLight
                                  ? Colors.black
                                  : CustomColors.btnCtrlWhite,
                              num1: num1,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await player.play(
                                  AssetSource('iphone_sound_trim.mp3'),
                                  volume: 0.2,
                                );
                                setState(() {
                                  oper.text = "x";
                                  num1.text = "(${num1.text})*";
                                });
                              },
                              child: ControlContainer(
                                buttonColor: isLight
                                    ? CustomColors.lightButtonColor
                                    : CustomColors.buttonColor,
                                controlText: "×",
                                controlColor: CustomColors.btnCtrlRed,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonWidget(
                              buttonColor: isLight
                                  ? CustomColors.lightButtonColor
                                  : CustomColors.buttonColor,
                              controlText: "4",
                              controlColor: isLight
                                  ? Colors.black
                                  : CustomColors.btnCtrlWhite,
                              num1: num1,
                            ),
                            ButtonWidget(
                              buttonColor: isLight
                                  ? CustomColors.lightButtonColor
                                  : CustomColors.buttonColor,
                              controlText: "5",
                              controlColor: isLight
                                  ? Colors.black
                                  : CustomColors.btnCtrlWhite,
                              num1: num1,
                            ),
                            ButtonWidget(
                              buttonColor: isLight
                                  ? CustomColors.lightButtonColor
                                  : CustomColors.buttonColor,
                              controlText: "6",
                              controlColor: isLight
                                  ? Colors.black
                                  : CustomColors.btnCtrlWhite,
                              num1: num1,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await player.play(
                                  AssetSource('iphone_sound_trim.mp3'),
                                  volume: 0.2,
                                );
                                setState(() {
                                  oper.text = "-";
                                  num1.text = "${num1.text}-";
                                });
                              },
                              child: ControlContainer(
                                buttonColor: isLight
                                    ? CustomColors.lightButtonColor
                                    : CustomColors.buttonColor,
                                controlText: "-",
                                controlColor: CustomColors.btnCtrlRed,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonWidget(
                              buttonColor: isLight
                                  ? CustomColors.lightButtonColor
                                  : CustomColors.buttonColor,
                              controlText: "1",
                              controlColor: isLight
                                  ? Colors.black
                                  : CustomColors.btnCtrlWhite,
                              num1: num1,
                            ),
                            ButtonWidget(
                              buttonColor: isLight
                                  ? CustomColors.lightButtonColor
                                  : CustomColors.buttonColor,
                              controlText: "2",
                              controlColor: isLight
                                  ? Colors.black
                                  : CustomColors.btnCtrlWhite,
                              num1: num1,
                            ),
                            ButtonWidget(
                              buttonColor: isLight
                                  ? CustomColors.lightButtonColor
                                  : CustomColors.buttonColor,
                              controlText: "3",
                              controlColor: isLight
                                  ? Colors.black
                                  : CustomColors.btnCtrlWhite,
                              num1: num1,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await player.play(
                                  AssetSource('iphone_sound_trim.mp3'),
                                  volume: 0.2,
                                );
                                setState(() {
                                  oper.text = "+";
                                  num1.text = "${num1.text}+";
                                });
                              },
                              child: ControlContainer(
                                buttonColor: isLight
                                    ? CustomColors.lightButtonColor
                                    : CustomColors.buttonColor,
                                controlText: "+",
                                controlColor: CustomColors.btnCtrlRed,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await player.play(
                                  AssetSource('iphone_sound_trim.mp3'),
                                  volume: 0.2,
                                );
                                setState(() {
                                  num1.clear();
                                  answerText.clear();
                                });
                              },
                              child: ControlContainer(
                                buttonColor: isLight
                                    ? CustomColors.lightButtonColor
                                    : CustomColors.buttonColor,
                                controlText: "⟳",
                                controlColor: isLight
                                    ? Colors.black
                                    : CustomColors.btnCtrlWhite,
                              ),
                            ),
                            ButtonWidget(
                              buttonColor: isLight
                                  ? CustomColors.lightButtonColor
                                  : CustomColors.buttonColor,
                              controlText: "0",
                              controlColor: isLight
                                  ? Colors.black
                                  : CustomColors.btnCtrlWhite,
                              num1: num1,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await player.play(
                                  AssetSource('iphone_sound_trim.mp3'),
                                  volume: 0.2,
                                );
                                setState(() {
                                  num1.text = "${num1.text}.";
                                });
                              },
                              child: ControlContainer(
                                buttonColor: isLight
                                    ? CustomColors.lightButtonColor
                                    : CustomColors.buttonColor,
                                controlText: ".",
                                controlColor: isLight
                                    ? Colors.black
                                    : CustomColors.btnCtrlWhite,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  String result = calc(num1.text);
                                  num number = num.parse(result);
                                  String formattedNumber =
                                      NumberFormat('#,##0.00').format(number);
                                  answerText.text = formattedNumber;
                                });
                              },
                              onDoubleTap: () async {
                                await player.play(
                                  AssetSource('iphone_sound_trim.mp3'),
                                  volume: 0.2,
                                );
                                // num number = num.parse(num1.text);
                                // String formattedNumber =
                                //     NumberFormat('#,##0.00').format(number);
                                // setState(() {
                                //   num1.text = formattedNumber;
                                //   answerText.clear();
                                // });
                                setState(() {
                                  // num1.text = answerText.text;
                                  String original =
                                      answerText.text.replaceAll(',', '');
                                  num1.text = original;
                                  answerText.clear();
                                });
                              },
                              child: ControlContainer(
                                buttonColor: isLight
                                    ? CustomColors.lightButtonColor
                                    : CustomColors.buttonColor,
                                controlText: "=",
                                controlColor: CustomColors.btnCtrlRed,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String calc(String v) {
    String modVal = v;
    Parser p = Parser();
    Expression e = p.parse(modVal);
    ContextModel cm = ContextModel();
    num eval = e.evaluate(EvaluationType.REAL, cm);
    String a = eval.toString();

    return a.length > 20 ? eval.toStringAsPrecision(16) : a;
  }
}
