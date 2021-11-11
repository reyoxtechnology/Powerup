import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/power/power_cantap.dart';
import 'package:powerup/ui_screen/power/power_text.dart';
import 'package:powerup/ui_screen/power/power_textfield.dart';
import 'package:powerup/ui_screen/power/power_txtbtn.dart';

class LoginTab extends StatelessWidget {
  const LoginTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 21.w,right: 21.w),
        child:ListView(
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 9.h),
                child:PowerText(text: 'Email Address',color: Color(0xff979797),)
            )  ,
            PowerTextField(),
            Container(
              margin: EdgeInsets.only(top: 21.h,bottom: 9.h),
              child:PowerText(text: 'Password',color:Color(0xff979797) ,) ,
            ) ,
            PowerTextField(),
            Container(
              margin:EdgeInsets.only(top:13.h),
              child: PowerCantap(
                onTap: (){
                },
                child: PowerText(
                  text: 'Forgot password',
                  textAlign: TextAlign.right,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff082F7C),
                  fontSize: 15.sp,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 42.h),
                child:PowerTxtBtn(text: 'continue',onTap: (){},)
            ) ,

          ],
        )
    );
  }
}
