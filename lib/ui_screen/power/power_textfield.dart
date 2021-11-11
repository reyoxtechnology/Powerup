import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/power/power_text.dart';

class PowerTextField extends StatelessWidget {
  final TextEditingController? txtController;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final bool? obscureText;
  final TextAlign? textAlign;
  final dynamic onChange;
   PowerTextField({
    Key? key,
    this.txtController,
    this.focusNode,
    this.textInputType,
    this.obscureText,
    this.textAlign,
    this.onChange
  }) : super(key: key);
  dynamic _outlineInputBorder = OutlineInputBorder(
      borderRadius:  BorderRadius.circular(15.h),
      borderSide: BorderSide(
          color: Colors.transparent,
          style: BorderStyle.none
      )
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        textAlign:textAlign??TextAlign.start ,
        focusNode:focusNode ,
        controller: txtController,
        obscureText:obscureText ??false,
        onChanged:(value){
          if(onChange!=null)
          this.onChange!(value);
        } ,
        decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.only(left: 24.sp),
          focusedBorder: _outlineInputBorder,
          disabledBorder:  _outlineInputBorder ,
          enabledBorder:  _outlineInputBorder,
          fillColor: Color(0xFFF3F6FA),
          border:  _outlineInputBorder,
        ),
      ),
    );
  }
}
