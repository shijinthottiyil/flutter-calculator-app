import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:my_calculator/view/widgets/control_container.dart';

class ButtonWidget extends StatefulWidget {
  ButtonWidget({
    super.key,
    required this.buttonColor,
    required this.controlText,
    required this.controlColor,
    required this.num1,
  });
  final Color buttonColor;
  final String controlText;
  final Color controlColor;
  final TextEditingController num1;

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
          volume: 0.2,
        );

        setState(() {
          if (widget.num1.text == "0" || widget.num1.text == "") {
            widget.num1.text = widget.controlText;
          } else {
            widget.num1.text = "${widget.num1.text}${widget.controlText}";
          }
        });
      },
      child: ControlContainer(
        buttonColor: widget.buttonColor,
        controlText: widget.controlText,
        controlColor: widget.controlColor,
      ),
    );
  }
}
