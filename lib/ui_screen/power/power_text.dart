import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class PowerText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? lineHeight;
  final Color? color;
  final double? height;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final Color? bgColor;
  const PowerText(
      {Key? key,
      required this.text,
      this.fontSize,
      this.fontFamily,
      this.fontWeight,
      this.lineHeight,
      this.color,
      this.height,
      this.textAlign,
      this.textDecoration,
      this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: textAlign,
      strutStyle: StrutStyle(height: lineHeight),
      style: TextStyle(
          fontSize: fontSize ?? 18.h,
          fontFamily: fontFamily ?? 'Poppins',
          fontWeight: fontWeight ?? FontWeight.w600,
          fontStyle: FontStyle.normal,
          color: color ?? const Color(0xFF263238),
          height: height,
          decoration: textDecoration),
    );
  }
}
