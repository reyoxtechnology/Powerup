import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/power/power_scrollbehaviour.dart';
import 'package:powerup/ui_screen/power/power_text.dart';
import 'package:powerup/ui_screen/power/power_textfield.dart';
import 'package:powerup/ui_screen/power/power_txtbtn.dart';
import 'package:powerup/ui_screen/uicontroller/uicontroller.dart';
import 'package:powerup/utils/general_functions.dart';

class SignUpTab extends StatelessWidget {
   SignUpTab({Key? key}) : super(key: key);

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 21.w,right: 21.w),
      child:ScrollConfiguration(
        behavior: PowerScrollBehavior(),
        child: ListView(
          children: [
           Container(
             margin: EdgeInsets.only(bottom: 9.h),
             child:const PowerText(text: 'Full-Name',color: Color(0xff979797),)
           )  ,
            PowerTextField(
            ),
           Container(
             margin: EdgeInsets.only(top: 21.h,bottom: 9.h),
             child:const PowerText(text: 'Email Address',color:Color(0xff979797) ,) ,
           ) ,
            PowerTextField(),
           Container(
             child:const PowerText(
               text:'Password',
               color: Color(0xff979797),
               ) ,
             margin: EdgeInsets.only(top: 12.h,bottom: 9.h),
           ) ,
            PowerTextField(
              obscureText: true,
            ),
            Container(
              margin: EdgeInsets.only(top: 30.h),
              child:PowerTxtBtn(
                text: 'continue',
                onTap: (){
                  goto(screen: const UiController(), context: context);
                },
              )
            ) ,

          ],
        ),
      )
    );
  }
}
