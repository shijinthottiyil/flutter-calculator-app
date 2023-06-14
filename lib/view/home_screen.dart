import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
  // var num2 = TextEditingController(text: "0");
  var oper = TextEditingController(text: "");
  var answerText = TextEditingController(text: "");
  bool isLight = false;
  // bool isNum1 = true;
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
                  // alignment: Alignment.topCenter,

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
                // decoration: BoxDecoration(
                //   color: isLight
                //       ? CustomColors.lighttoggleColor
                //       : CustomColors.scaffoldColor,
                // ),
                width: double.infinity,
                height: double.infinity,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Placeholder(
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         child: Container(
                      //           height: 70,
                      //           width: double.infinity,
                      //           child: Text(
                      //             num1.text,
                      //             textAlign: TextAlign.end,
                      //             style: TextStyle(
                      //               color:
                      //                   isLight ? Colors.black : Colors.white,
                      //               fontSize: 70,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      //   // child: TextFormField(
                      //   //   decoration: InputDecoration.collapsed(
                      //   //     hintText: "",
                      //   //   ),
                      //   //   textAlign: TextAlign.end,
                      //   //   style: TextStyle(
                      //   //     color: isLight ? Colors.black : Colors.white,
                      //   //     fontSize: 70,
                      //   //     fontWeight: FontWeight.bold,
                      //   //   ),
                      //   //   focusNode: _focusNode,
                      //   //   onTap: () {
                      //   //     _focusNode.unfocus();
                      //   //     _focusNode.canRequestFocus = false;
                      //   //   },
                      //   //   controller: num1,
                      //   // ),
                      // ),
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
                      // Flexible(
                      //   child: TextFormField(
                      //     decoration: InputDecoration.collapsed(
                      //       hintText: "",
                      //     ),
                      //     textAlign: TextAlign.end,
                      //     style: TextStyle(
                      //       color: isLight ? Colors.black : Colors.white,
                      //       fontSize: 70,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //     focusNode: _focusNode,
                      //     onTap: () {
                      //       _focusNode.unfocus();
                      //       _focusNode.canRequestFocus = false;
                      //     },
                      //     controller: oper,
                      //   ),
                      // ),
                      // Flexible(
                      //   child: TextFormField(
                      //     decoration: InputDecoration.collapsed(
                      //       hintText: "",
                      //     ),
                      //     textAlign: TextAlign.end,
                      //     style: TextStyle(
                      //       color: isLight ? Colors.black : Colors.white,
                      //       fontSize: 70,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //     focusNode: _focusNode,
                      //     onTap: () {
                      //       _focusNode.unfocus();
                      //       _focusNode.canRequestFocus = false;
                      //     },
                      //     controller: num2,
                      //   ),
                      // ),
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
                  // child: Column(
                  //   children: [
                  //     // Text(
                  //     //   num1.text,
                  //     //   style: TextStyle(
                  //     //     color: isLight ? Colors.black : Colors.white,
                  //     //     fontSize: 70,
                  //     //     fontWeight: FontWeight.bold,
                  //     //   ),
                  //     // ),
                  //     // Spacer(),
                  //     // Text(
                  //     //   answerText.text,
                  //     //   style: TextStyle(
                  //     //     color: isLight ? Colors.black : Colors.white,
                  //     //     fontSize: 70,
                  //     //     fontWeight: FontWeight.bold,
                  //     //   ),
                  //     // ),
                  //   ],
                  // ),
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
                      // bottomRight: Radius.circular(20.h),
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
                                  volume: 0.5,
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
                                  volume: 0.5,
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
                            // ButtonWidget(
                            //   buttonColor: isLight
                            //       ? CustomColors.lightButtonColor
                            //       : CustomColors.buttonColor,
                            //   controlText: "%",
                            //   controlColor: CustomColors.btnCtrlGreen,
                            //   num1: num1,
                            //   isOper: true,
                            //   operText: "%",
                            // ),
                            GestureDetector(
                              onTap: () async {
                                await player.play(
                                  AssetSource('iphone_sound_trim.mp3'),
                                  volume: 0.5,
                                );
                                oper.text = "%";
                                num number = num.parse(num1.text);
                                num result = number / 100;
                                setState(() {
                                  answerText.text = result.toString();
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
                            // ButtonWidget(
                            //   buttonColor: isLight
                            //       ? CustomColors.lightButtonColor
                            //       : CustomColors.buttonColor,
                            //   controlText: "÷",
                            //   controlColor: CustomColors.btnCtrlRed,
                            //   num1: num1,
                            //   isOper: true,
                            //   operText: "÷",
                            // ),
                            GestureDetector(
                              onTap: () async {
                                await player.play(
                                  AssetSource('iphone_sound_trim.mp3'),
                                  volume: 0.5,
                                );
                                setState(() {
                                  oper.text = "÷";
                                  num1.text = "${num1.text}÷";
                                });
                              },
                              child: ControlContainer(
                                  buttonColor: isLight
                                      ? CustomColors.lightButtonColor
                                      : CustomColors.buttonColor,
                                  controlText: "÷",
                                  controlColor: CustomColors.btnCtrlRed),
                            ),
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   color: Colors.red,
                            // ),
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   color: Colors.red,
                            // ),
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   color: Colors.red,
                            // ),
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
                            // GestureDetector(
                            //   onTap: () async {
                            //     await player.play(
                            //       AssetSource('iphone_sound_trim.mp3'),
                            //       volume: 0.5,
                            //     );
                            //     //  final play = AudioCache(prefix: 'assets/');
                            //     //  final url = await play.load('sound.mp3');
                            //     //  await player.setSourceUrl(url,)
                            //     //   await player
                            //     //       .play(AssetSource('assets/sound.mp3'));
                            //     setState(() {
                            //       if (num1.text == "0" || num1.text == "") {
                            //         num1.text = "7";
                            //       } else {
                            //         num1.text = "${num1.text}7";
                            //       }
                            //     });
                            //   },
                            //   child: ControlContainer(
                            //     buttonColor: isLight
                            //         ? CustomColors.lightButtonColor
                            //         : CustomColors.buttonColor,
                            //     controlText: "7",
                            //     controlColor: isLight
                            //         ? Colors.black
                            //         : CustomColors.btnCtrlWhite,
                            //   ),
                            // ),
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
                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       if (num1.text == "0" || num1.text == "") {
                            //         num1.text = "8";
                            //       } else {
                            //         num1.text = "${num1.text}8";
                            //       }
                            //     });
                            //   },
                            //   child: ControlContainer(
                            //     buttonColor: isLight
                            //         ? CustomColors.lightButtonColor
                            //         : CustomColors.buttonColor,
                            //     controlText: "8",
                            //     controlColor: isLight
                            //         ? Colors.black
                            //         : CustomColors.btnCtrlWhite,
                            //   ),
                            // ),
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
                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       if (num1.text == "0" || num1.text == "") {
                            //         num1.text = "9";
                            //       } else {
                            //         num1.text = "${num1.text}9";
                            //       }
                            //     });
                            //   },
                            //   child: ControlContainer(
                            //     buttonColor: isLight
                            //         ? CustomColors.lightButtonColor
                            //         : CustomColors.buttonColor,
                            //     controlText: "9",
                            //     controlColor: isLight
                            //         ? Colors.black
                            //         : CustomColors.btnCtrlWhite,
                            //   ),
                            // ),
                            // ButtonWidget(
                            //   buttonColor: isLight
                            //       ? CustomColors.lightButtonColor
                            //       : CustomColors.buttonColor,
                            //   controlText: "×",
                            //   controlColor: CustomColors.btnCtrlRed,
                            //   num1: num1,
                            //   isOper: true,
                            //   operText: "x",
                            // ),
                            GestureDetector(
                              onTap: () async {
                                await player.play(
                                  AssetSource('iphone_sound_trim.mp3'),
                                  volume: 0.5,
                                );
                                setState(() {
                                  oper.text = "x";
                                  num1.text = "${num1.text}x";
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
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   color: Colors.red,
                            // ),
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   color: Colors.red,
                            // ),
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   color: Colors.red,
                            // ),
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   color: Colors.red,
                            // ),
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
                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       if (num1.text == "0" || num1.text == "") {
                            //         num1.text = "4";
                            //       } else {
                            //         num1.text = "${num1.text}4";
                            //       }
                            //     });
                            //   },
                            //   child: ControlContainer(
                            //     buttonColor: isLight
                            //         ? CustomColors.lightButtonColor
                            //         : CustomColors.buttonColor,
                            //     controlText: "4",
                            //     controlColor: isLight
                            //         ? Colors.black
                            //         : CustomColors.btnCtrlWhite,
                            //   ),
                            // ),
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
                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       if (num1.text == "0" || num1.text == "") {
                            //         num1.text = "5";
                            //       } else {
                            //         num1.text = "${num1.text}5";
                            //       }
                            //     });
                            //   },
                            //   child: ControlContainer(
                            //     buttonColor: isLight
                            //         ? CustomColors.lightButtonColor
                            //         : CustomColors.buttonColor,
                            //     controlText: "5",
                            //     controlColor: isLight
                            //         ? Colors.black
                            //         : CustomColors.btnCtrlWhite,
                            //   ),
                            // ),
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
                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       if (num1.text == "0" || num1.text == "") {
                            //         num1.text = "6";
                            //       } else {
                            //         num1.text = "${num1.text}6";
                            //       }
                            //     });
                            //   },
                            //   child: ControlContainer(
                            //     buttonColor: isLight
                            //         ? CustomColors.lightButtonColor
                            //         : CustomColors.buttonColor,
                            //     controlText: "6",
                            //     controlColor: isLight
                            //         ? Colors.black
                            //         : CustomColors.btnCtrlWhite,
                            //   ),
                            // ),
                            // ButtonWidget(
                            //   buttonColor: isLight
                            //       ? CustomColors.lightButtonColor
                            //       : CustomColors.buttonColor,
                            //   controlText: "-",
                            //   controlColor: CustomColors.btnCtrlRed,
                            //   num1: num1,
                            //   isOper: true,
                            //   operText: "-",
                            // ),
                            GestureDetector(
                              onTap: () async {
                                await player.play(
                                  AssetSource('iphone_sound_trim.mp3'),
                                  volume: 0.5,
                                );
                                setState(() {
                                  oper.text = "-";
                                  num1.text = "${num1.text}-";
                                  // if (num1.text == "0") {
                                  //   num1.text = "-";
                                  // } else {
                                  //   num1.text = "${num1.text}-";
                                  // }
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
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   color: Colors.red,
                            // ),
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   color: Colors.red,
                            // ),
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   color: Colors.red,
                            // ),
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   color: Colors.red,
                            // ),
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
                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       if (num1.text == "0" || num1.text == "") {
                            //         num1.text = "1";
                            //       } else {
                            //         num1.text = "${num1.text}1";
                            //       }
                            //     });
                            //   },
                            //   child: ControlContainer(
                            //     buttonColor: isLight
                            //         ? CustomColors.lightButtonColor
                            //         : CustomColors.buttonColor,
                            //     controlText: "1",
                            //     controlColor: isLight
                            //         ? Colors.black
                            //         : CustomColors.btnCtrlWhite,
                            //   ),
                            // ),
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
                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       if (num1.text == "0" || num1.text == "") {
                            //         num1.text = "2";
                            //       } else {
                            //         num1.text = "${num1.text}2";
                            //       }
                            //     });
                            //   },
                            //   child: ControlContainer(
                            //     buttonColor: isLight
                            //         ? CustomColors.lightButtonColor
                            //         : CustomColors.buttonColor,
                            //     controlText: "2",
                            //     controlColor: isLight
                            //         ? Colors.black
                            //         : CustomColors.btnCtrlWhite,
                            //   ),
                            // ),
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
                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       if (num1.text == "0" || num1.text == "") {
                            //         num1.text = "3";
                            //       } else {
                            //         num1.text = "${num1.text}3";
                            //       }
                            //     });
                            //   },
                            //   child: ControlContainer(
                            //     buttonColor: isLight
                            //         ? CustomColors.lightButtonColor
                            //         : CustomColors.buttonColor,
                            //     controlText: "3",
                            //     controlColor: isLight
                            //         ? Colors.black
                            //         : CustomColors.btnCtrlWhite,
                            //   ),
                            // ),
                            // ButtonWidget(
                            //   buttonColor: isLight
                            //       ? CustomColors.lightButtonColor
                            //       : CustomColors.buttonColor,
                            //   controlText: "+",
                            //   controlColor: CustomColors.btnCtrlRed,
                            //   num1: num1,
                            //   isOper: true,
                            //   operText: "+",
                            // ),
                            GestureDetector(
                              onTap: () async {
                                await player.play(
                                  AssetSource('iphone_sound_trim.mp3'),
                                  volume: 0.5,
                                );
                                setState(() {
                                  // num1.text = "${num1.text}+";
                                  // final splitted = num1.text.split('+');
                                  // print(splitted);
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
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   color: Colors.red,
                            // ),
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   color: Colors.red,
                            // ),
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   color: Colors.red,
                            // ),
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   color: Colors.red,
                            // ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await player.play(
                                  AssetSource('iphone_sound_trim.mp3'),
                                  volume: 0.5,
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
                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       if (num1.text == "0" || num1.text == "") {
                            //         num1.text = "0";
                            //       } else {
                            //         num1.text = "${num1.text}0";
                            //       }
                            //     });
                            //   },
                            //   child: ControlContainer(
                            //     buttonColor: isLight
                            //         ? CustomColors.lightButtonColor
                            //         : CustomColors.buttonColor,
                            //     controlText: "0",
                            //     controlColor: isLight
                            //         ? Colors.black
                            //         : CustomColors.btnCtrlWhite,
                            //   ),
                            // ),
                            GestureDetector(
                              onTap: () async {
                                await player.play(
                                  AssetSource('iphone_sound_trim.mp3'),
                                  volume: 0.5,
                                );
                                setState(() {
                                  // if(num1.text == "0"){

                                  // }
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
                                final splitted = num1.text.split(oper.text);
                                print("this is the splitted value $splitted");
                                num number1 = num.parse(splitted[0]);
                                print("this is number1 $number1");

                                num number2 = num.parse(splitted[1]);
                                print("this is number2 $number2");
                                num result = 0;
                                switch (oper.text) {
                                  case "+":
                                    result = number1 + number2;
                                    break;
                                  case "-":
                                    result = number1 - number2;
                                    break;
                                  case "x":
                                    result = number1 * number2;
                                    break;
                                  case "÷":
                                    result = number1 / number2;
                                    break;
                                }
                                // if (oper.text == "+") {
                                //   result = number1 + number2;
                                // } else if (oper.text == '-') {
                                //   result = number1 - number2;
                                // } else if (oper.text == 'x') {
                                //   result = number1 * number2;
                                // } else if (oper.text == '÷') {
                                //   result = number1 / number2;
                                // }
                                setState(() {
                                  answerText.text = result.toString();
                                });
                              },
                              onDoubleTap: () async {
                                await player.play(
                                  AssetSource('iphone_sound_trim.mp3'),
                                  volume: 0.5,
                                );
                                setState(() {
                                  num1.text = answerText.text;
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
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   color: Colors.red,
                            // ),
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   color: Colors.red,
                            // ),
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   color: Colors.red,
                            // ),
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   color: Colors.red,
                            // ),
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
}
