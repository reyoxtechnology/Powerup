// @dart=2.9
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/power/power_scrollbehaviour.dart';
import 'package:powerup/ui_screen/power/power_text.dart';
import 'package:powerup/ui_screen/power/power_textfield.dart';
import 'package:powerup/ui_screen/power/power_txtbtn.dart';
import 'package:powerup/ui_screen/uicontroller/uicontroller.dart';
import 'package:powerup/utils/general_functions.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../providers/user_provider.dart';
import '../../utils/validators.dart';
import '../../utils/widgets.dart';

import '../../providers/auth.dart';
import '../forgotpassword/verify_email_screen.dart';

// ignore: must_be_immutable
class SignUpTab extends StatefulWidget {
  const SignUpTab({key}) : super(key: key);

  @override
  _SignUpTab createState() => _SignUpTab();
}

class _SignUpTab extends  State<SignUpTab>  {
  final _formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    void _doSign() {
      final form = _formKey.currentState;
      if (form.validate()) {
        form.save();

        final Future<Map<String, dynamic>> successfulMessage =
            auth.register(fullNameController.text, emailController.text, passwordController.text);

        successfulMessage.then((response) {
          if (response['status']) {
            User user = response['user'];
            Provider.of<UserProvider>(context, listen: false).setUser(user);
            //Navigator.pushReplacementNamed(context, '/dashboard');
            goto(screen: VerifyEmailScreen(), context: context);
          } else {
            Flushbar(
              title: "Failed to Signup",
              message: response['message'].toString(),
              duration: const Duration(seconds: 3),
            ).show(context);
          }
        });
      } else {
        print("form is invalid");
      }
    };


    return Form(
      key: _formKey,
      child: Container(
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
              txtController:fullNameController
            ),
           Container(
             margin: EdgeInsets.only(top: 21.h,bottom: 9.h),
             child:const PowerText(text: 'Email Address',color:Color(0xff979797) ,) ,
           ) ,
            PowerTextField(
              txtController:emailController
            ),
           Container(
             child:const PowerText(
               text:'Password',
               color: Color(0xff979797),
               ) ,
             margin: EdgeInsets.only(top: 12.h,bottom: 9.h),
           ) ,
            PowerTextField(
              txtController: passwordController,
              obscureText: true,
            ),
            Container(
              margin: EdgeInsets.only(top: 30.h),
              child:PowerTxtBtn(
                text: 'continue',
                onTap: (){
                  _doSign();
                },
              )
            ) ,

          ],
        ),
      )
    ),
    );
  }
}
