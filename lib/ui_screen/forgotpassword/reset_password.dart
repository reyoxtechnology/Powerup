// @dart=2.9
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'package:powerup/ui_screen/baseui/baseui.dart';
import 'package:powerup/ui_screen/forgotpassword/entercode_screen.dart';
import 'package:powerup/ui_screen/power/power_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/power/power_textfield.dart';
import 'package:powerup/ui_screen/power/power_txtbtn.dart';
import 'package:powerup/utils/general_functions.dart';
import 'package:provider/provider.dart';

import '../../services/email_password_reset.dart';
import '../home/home.dart';
import '../uicontroller/uicontroller.dart';

class NewPasswordReset extends StatefulWidget {
  const NewPasswordReset({Key key}) : super(key: key);

  @override
  State<NewPasswordReset> createState() => _NewPasswordResetState();
}

class _NewPasswordResetState extends State<NewPasswordReset> {
  final FocusNode focusNode = FocusNode();

  bool isKeyboardUp = false;

  final _formKey = GlobalKey<FormState>();
  String _newPassword;
  String _newConfirmPassword;

  @override
  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isKeyboardUp = true;
        });
      } else {
        setState(() {
          isKeyboardUp = false;
        });
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

  EmailVerifyPasswordReset fPassword = Provider.of<EmailVerifyPasswordReset>(context);

    void _resetPassword(){
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
    }
    Future<Map<String, dynamic>> response =  fPassword.setNewPassword(_newPassword);
  
    response.then((value) => {
      if(value['status']){
        goto(screen: const UiController(), context: context)
      } else {
        Flushbar(
          title: "Failed Login",
          message: value['message'].toString(),
          duration: const Duration(seconds: 3),
        ).show(context)
      }
    });
  }

    return Form(
      key: _formKey,
      child:  GestureDetector(
      onDoubleTap: () {
        if (focusNode.hasFocus) {
          focusNode.unfocus();
        }
      },
      child: BaseUi(
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
                      ?const SizedBox()
                      : Image.asset(
                          'power_imgs/quickpay_logo.png',
                          width: 270.w,
                          height: 234.h,
                        ),
                ),
                inputDetail(),
                Container(
                  width: 272.w,
                  margin: EdgeInsets.only(top: isKeyboardUp ? 35.h : 58.h),
                  child: PowerTxtBtn(
                    bgColor: const Color(0xff082F7C),
                    text: 'Send',
                    onTap: () => {
                        _resetPassword(), 
                    },
                  ),
                ),
              ],
            ))
      ])),
    ),
    );
  }

  Widget header(BuildContext context) {
    return Container(
        height: isKeyboardUp ? 121.h : 139.h,
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
            text: 'New',
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
                text: 'New Password',
                color: Color(0xff979797),
              )),
          PowerTextField(
            obscureText: true,
            focusNode: focusNode,
            onChange: (value) => _newPassword = value,
          ),
        Container(
              margin: EdgeInsets.only(bottom: 9.h),
              child: const PowerText(
                text: 'Confirm New Password',
                color: Color(0xff979797),
              )),
          PowerTextField(
            obscureText: true,
            focusNode: focusNode,
            onChange: (value) => _newConfirmPassword = value,
          ),
        ],
      ),
    );
  }
}