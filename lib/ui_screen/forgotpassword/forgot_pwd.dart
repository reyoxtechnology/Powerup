import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:powerup/ui_screen/baseui.dart';
import 'package:powerup/ui_screen/power/power_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/power/power_textfield.dart';
import 'package:powerup/ui_screen/power/power_txtbtn.dart';

class ForgotPwdScreen extends StatefulWidget {
  const ForgotPwdScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPwdScreen> createState() => _ForgotPwdScreenState();
}

class _ForgotPwdScreenState extends State<ForgotPwdScreen> {
  final FocusNode focusNode = FocusNode();

  bool isKeyboardUp = false;

  @override
  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isKeyboardUp = true;
        });
      }else{
        setState(() {
          isKeyboardUp = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseUi(
        child: Stack(children: [
      Positioned(
        top: 0.0,
        child: header(context),
        left: -19.w,
      ),
      Positioned(top: 28.h, left: 38.w, child: title()),
      Positioned(
          top: 139.h,
          left: 0.0,
          right: 0.0,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 25.h),
                child: Center(
                    child: isKeyboardUp
                        ? tempWidget()
                        : Image.asset(
                            'power_imgs/poweruplogo.png',
                            width: 230.w,
                            height: 78.h,
                          )),
              ),
              Container(
                margin: EdgeInsets.only(top: 11.h),
                child: isKeyboardUp
                    ? SizedBox()
                    : Image.asset(
                        'power_imgs/quickpay_logo.png',
                        width: 270.w,
                        height: 234.h,
                      ),
              ),
              inputDetail(),
              sendBtn()
            ],
          ))
    ]));
  }

  Widget header(BuildContext context) {
    return Container(
        height:isKeyboardUp?121.h: 139.h,
        width: 414.w,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.only(bottomRight: Radius.circular(331.03.r)),
          color: const Color(0xFF082F7C),
        ));
  }

  Widget title() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          PowerText(
            text: 'Forget',
            color: const Color(0xFFFFFFFF),
            fontSize: 32.sp,
            textAlign: TextAlign.left,
          ),
          PowerText(
              textAlign: TextAlign.left,
              text: 'Password',
              color: const Color(0xFFFFFFFF),
              fontSize: 32.sp)
        ]);
  }

  Widget inputDetail() {
    return Container(
      width: 313.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 9.h),
              child: const PowerText(
                text: 'Email Address',
                color: Color(0xff979797),
              )),
          PowerTextField(
            focusNode: focusNode,
          ),
        ],
      ),
    );
  }

  Widget sendBtn() {
    return Container(
      width: 272.w,
      margin: EdgeInsets.only(top: isKeyboardUp?35.h: 58.h),
      child: const PowerTxtBtn(
        bgColor: Color(0xff082F7C),
        text: 'send',
      ),
    );
  }

  Widget tempWidget() {
    return Container(
      width: 100.75.w,
      height: 105.87.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('power_imgs/reload_img.png'),
          Image.asset('power_imgs/lock.png')
        ],
      ),
    );
  }
}
