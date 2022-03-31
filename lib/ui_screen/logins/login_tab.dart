// @dart=2.9
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/forgotpassword/forgot_pwd_screen.dart';
import 'package:powerup/ui_screen/power/power_cantap.dart';
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

class LoginTab extends StatefulWidget {
  const LoginTab({Key key}) : super(key: key);

  @override
  _LoginTab createState() => _LoginTab();
}

class _LoginTab extends  State<LoginTab>  {
  final _formKey = GlobalKey<FormState>();

  String _email, _password;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    void _doLogin() {
      final form = _formKey.currentState;
      if (form.validate()) {
        form.save();

        final Future<Map<String, dynamic>> successfulMessage =
            auth.login(_email, _password);

        successfulMessage.then((response) {
          if (response['status']) {
            User user = response['user'];
            Provider.of<UserProvider>(context, listen: false).setUser(user);
            //Navigator.pushReplacementNamed(context, '/dashboard');
            goto(screen: const UiController(), context: context);
          } else {
            Flushbar(
              title: "Failed Login",
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
              PowerTextField(
                onChange: (value) => _email = value,
              ),
              Container(
                margin: EdgeInsets.only(top: 21.h, bottom: 9.h),
                child: const PowerText(
                  text: 'Password',
                  color: Color(0xff979797),
                ),
              ),
              PowerTextField(
                obscureText: true,
                onChange: (value) => _password = value,
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
                      _doLogin();
                      //goto(screen: const UiController(), context: context);
                    },
                  )),
            ],
          ),
        )),
    );
  

  }

Widget _flubar(){
  
}
}


