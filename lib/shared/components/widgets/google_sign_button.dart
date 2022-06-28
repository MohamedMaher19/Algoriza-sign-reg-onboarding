import 'package:flutter/material.dart';
import 'package:project/shared/components/widgets/custom_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/shared/styles/colors.dart';


class GoogleRegisterButton extends StatelessWidget {
  GoogleRegisterButton(
      {Key? key,
        required this.text,
         this.onPressed,
        required this.fontSize,
        required this.textColor,
        this.fontFamily,
        required this.buttonColor})
      : super(key: key);

  final String text;
   Function() ? onPressed;
  final double fontSize;
  final Color textColor;
  final Color buttonColor;
  String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed ,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15 , vertical:11),
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: blueColor,
              )

          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // FaIcon(FontAwesomeIcons.google),
              Image.asset('assets/images/google.jpg' , width: 30, height: 30,),
              SizedBox(width: 15,),

              TextUtils(
                fontFamily: fontFamily,
                text: text,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ],
          )),
    );
  }
}
