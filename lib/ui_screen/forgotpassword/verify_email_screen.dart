// @dart=2.9
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/baseui/baseui.dart';
import 'package:powerup/ui_screen/power/power_text.dart';
import 'package:powerup/ui_screen/power/power_textfield.dart';
import 'package:powerup/ui_screen/power/power_txtbtn.dart';
import 'package:powerup/utils/general_functions.dart';
import 'package:provider/provider.dart';

import '../../services/email_password_reset.dart';
import '../uicontroller/uicontroller.dart';

class VerifyEmailScreen extends StatelessWidget {
  VerifyEmailScreen({Key key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  String _token;

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  TextEditingController txtController1 = TextEditingController();
  TextEditingController txtController2 = TextEditingController();
  TextEditingController txtController3 = TextEditingController();
  TextEditingController txtController4 = TextEditingController();

  void unFocusAll() {
    focusNode1.unfocus();
    focusNode2.unfocus();
    focusNode3.unfocus();
    focusNode4.unfocus();
  }

  @override
  Widget build(BuildContext context) {

    EmailVerifyPasswordReset fPassword = Provider.of<EmailVerifyPasswordReset>(context);

    void _verifyEmail(){
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
    }

    _token = txtController1.text + txtController2.text + txtController3.text + txtController4.text;

    Future<Map<String, dynamic>> response =  fPassword.verifyEmail(_token);
  
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

    focusNode1.requestFocus();

      return Form(
      key: _formKey,
        child:  BaseUi(
        bgColor: const Color(0xFFE5E5E5),
        child: Stack(
          children: [
            Positioned(
              top: 30.h,
              right: 20.w,
              // ignore: prefer_const_constructors
              child: PowerTxtBtn(
                text: 'Cancel',
                textAlign: TextAlign.right,
                fontFamily: 'Sk-Modernist',
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                textDecoration: TextDecoration.underline,
                txtColor: const Color(0xFFFA5A1E),
                bgColor: Colors.transparent,
                onTap: () => pop(context),
              ),
            ),
            Positioned(
                top: 30.h,
                right: 0.0,
                left: 0.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 33.h),
                        child: Image.asset(
                          'power_imgs/poweruplogo.png',
                          width: 230.w,
                          height: 78.h,
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 29.h, bottom: 15.h),
                        child: PowerText(
                          text: 'Verify Email',
                          fontSize: 24.sp,
                          color: const Color(0xFF1C1C1C),
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                        )),
                    Container(
                      margin: EdgeInsets.only(bottom: 55.h),
                      child: PowerText(
                        text: 'Please check your email for a 4-digit pin to verify your email.',
                        fontSize: 14.sp,
                        color: const Color(0xFF3D3D3D),
                        fontFamily: 'Sk-Modernist',
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15.h),
                      child: PowerText(
                        text: 'Enter code',
                        fontFamily: 'Sk-Modernist',
                        fontSize: 12.sp,
                        color: const Color(0xFF3D3D3D),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 251.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: Container(
                                  margin: EdgeInsets.only(right: 5.w),
                                  child: PowerTextField(
                                    focusNode: focusNode1,
                                    maxLength: 1,
                                    txtController: txtController1,
                                    onChange: (String value) {
                                      if (value.length == 1) {
                                        focusNode2.requestFocus();
                                      }
                                    },
                                  ))),
                          Expanded(
                              child: Container(
                                  margin: EdgeInsets.only(right: 5.w),
                                  child: PowerTextField(
                                    focusNode: focusNode2,
                                    maxLength: 1,
                                    txtController: txtController2,
                                    onChange: (String value) {
                                      if (value.length == 1)
                                        focusNode3.requestFocus();
                                    },
                                  ))),
                          Expanded(
                              child: Container(
                                  margin: EdgeInsets.only(right: 5.w),
                                  child: PowerTextField(
                                    focusNode: focusNode3,
                                    maxLength: 1,
                                    txtController: txtController3,
                                    onChange: (String value) {
                                      if (value.length == 1) {
                                        focusNode4.requestFocus();
                                      }
                                    },
                                  ))),
                          Expanded(
                              child: PowerTextField(
                            focusNode: focusNode4,
                            txtController: txtController4,
                            maxLength: 1,
                            onChange: (String value) {
                              if (value.length == 1) focusNode4.unfocus();
                            },
                          )),
                        ],
                      ),
                    ),
                    Container(
                      width: 313.w,
                      margin: EdgeInsets.only(top: 36.h),
                      child: PowerTxtBtn(
                        bgColor: const Color(0xFF082F7C),
                        text: 'Verify Email',
                        onTap: () {
                          unFocusAll();
                          _verifyEmail();
                        },
                      ),
                    )
                  ],
                ))
          ],
        )),
      );
  }
}
