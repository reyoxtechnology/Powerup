import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/forgotpassword/forgot_pwd_screen.dart';
import 'package:powerup/ui_screen/power/power_cantap.dart';
import 'package:powerup/ui_screen/power/power_scrollbehaviour.dart';
import 'package:powerup/ui_screen/power/power_text.dart';
import 'package:powerup/ui_screen/power/power_textfield.dart';
import 'package:powerup/ui_screen/power/power_txtbtn.dart';
import 'package:powerup/ui_screen/uicontroller/uicontroller.dart';
import 'package:powerup/utils/general_functions.dart';

class LoginTab extends StatelessWidget {
  const LoginTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 21.w, right: 21.w),
        child: ScrollConfiguration(
          behavior: PowerScrollBehavior(),
          child: ListView(
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 9.h),
                  child: const PowerText(
                    text: 'Email Address',
                    color: Color(0xff979797),
                  )),
              PowerTextField(),
              Container(
                margin: EdgeInsets.only(top: 21.h, bottom: 9.h),
                child: const PowerText(
                  text: 'Password',
                  color: Color(0xff979797),
                ),
              ),
              PowerTextField(
                obscureText: true,
              ),
              Container(
                margin: EdgeInsets.only(top: 13.h),
                child: PowerCantap(
                  onTap: () {
                    goto(screen: const ForgotPwdScreen(), context: context);
                  },
                  child: PowerText(
                    text: 'Forgot password',
                    textAlign: TextAlign.right,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff082F7C),
                    fontSize: 15.sp,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 42.h),
                  child: PowerTxtBtn(
                    text: 'continue',
                    onTap: () {
                      goto(screen: const UiController(), context: context);
                    },
                  )),
            ],
          ),
        ));
  }
}
