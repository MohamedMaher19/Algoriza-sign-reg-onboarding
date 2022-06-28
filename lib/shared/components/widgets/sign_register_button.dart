import 'package:flutter/material.dart';
import 'package:project/shared/components/widgets/custom_text.dart';

class SignRegisterButton extends StatelessWidget {
  SignRegisterButton(
      {Key? key,
        required this.text,
        required this.onPressed,
        required this.fontSize,
        required this.textColor,
        this.fontFamily,
        required this.buttonColor})
      : super(key: key);

  final String text;
  final Function() onPressed;
  final double fontSize;
  final Color textColor;
  final Color buttonColor;
  String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          primary: buttonColor,
          minimumSize: Size(320, 57),
        ),
        onPressed: onPressed,
        child: TextUtils(
          fontFamily: fontFamily,
          text: text,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: textColor,
        ));
  }
}
