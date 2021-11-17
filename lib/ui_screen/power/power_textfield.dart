import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PowerTextField extends StatelessWidget {
  final TextEditingController? txtController;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final bool? obscureText;
  final TextAlign? textAlign;
  final dynamic onChange;
  final int? maxLength;
  final bool? readOnly;
  final Widget? suffix;
  final String? labelTxt;
  PowerTextField(
      {Key? key,
      this.txtController,
      this.focusNode,
      this.textInputType,
      this.obscureText,
      this.textAlign,
      this.maxLength,
      this.readOnly,
      this.suffix,
      this.labelTxt,
      this.onChange})
      : super(key: key);
  final dynamic _outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.h),
      borderSide:
          const BorderSide(color: Colors.transparent, style: BorderStyle.none));
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        textAlign: textAlign ?? TextAlign.start,
        focusNode: focusNode,
        controller: txtController,
        obscureText: obscureText ?? false,
        maxLength: maxLength,
        readOnly: readOnly??false,
        onChanged: (value) {
          if (onChange != null) {
            onChange!(value);
          }
        },
        decoration: InputDecoration(
          filled: true,
           suffixIcon:suffix  ,
          contentPadding: EdgeInsets.only(left: 24.sp),
          focusedBorder: _outlineInputBorder,
          disabledBorder: _outlineInputBorder,
          enabledBorder: _outlineInputBorder,
          labelText: labelTxt,
          fillColor: const Color(0xFFF3F6FA),
          border: _outlineInputBorder,
          counterText: ''
        ),
      ),
    );
  }
}
