import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/power/power_text.dart';

class PowerTxtBtn extends StatelessWidget {
  final String? text;
  final dynamic onTap;
  final Color? bgColor;
  final Color? txtColor;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? fontSize;

  const PowerTxtBtn(
      {Key? key,
      this.text,
      this.onTap,
      this.bgColor,
      this.txtColor,
      this.textAlign,
      this.fontWeight,
      this.fontFamily,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r))),
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => bgColor ?? Color(0xFFE19F21)),
        ),
        onPressed: () {
          print('txt btn');
          onTap();
        },
        child: Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
            child: PowerText(
              text: text ?? 'submit',
              color: txtColor ?? Colors.white,
              textAlign: textAlign,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
              fontSize: fontSize,
            )));
  }
}
