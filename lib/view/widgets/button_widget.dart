import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_calculator/view/home_screen.dart';
import 'package:my_calculator/view/widgets/control_container.dart';

class ButtonWidget extends StatefulWidget {
  ButtonWidget({
    super.key,
    required this.buttonColor,
    required this.controlText,
    required this.controlColor,
    required this.num1,
    // this.isOper = false,
    // this.operText = "",
  });
  final Color buttonColor;
  final String controlText;
  final Color controlColor;
  final TextEditingController num1;
  // TextEditingController oper = TextEditingController();
  // bool isOper;
  // String operText;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  final _player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _player.play(
          AssetSource('iphone_sound_trim.mp3'),
          volume: 0.5,
        );
        //  final play = AudioCache(prefix: 'assets/');
        //  final url = await play.load('sound.mp3');
        //  await player.setSourceUrl(url,)
        //   await player
        //       .play(AssetSource('assets/sound.mp3'));
        // if (widget.isOper) {
        //   setState(() {
        //     widget.oper.text = widget.operText;
        //     widget.num1.text = "${widget.num1.text}${widget.operText}";
        //   });
        // } else {
        setState(() {
          if (widget.num1.text == "0" || widget.num1.text == "") {
            widget.num1.text = widget.controlText;
          } else {
            widget.num1.text = "${widget.num1.text}${widget.controlText}";
          }
        });
        // }
      },
      child: ControlContainer(
        buttonColor: widget.buttonColor,
        controlText: widget.controlText,
        controlColor: widget.controlColor,
      ),
    );
  }
}
