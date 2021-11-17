import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/logins/baseui_loginstyle.dart';
import 'package:powerup/ui_screen/power/power_scrollbehaviour.dart';
import 'package:powerup/ui_screen/power/power_textfield.dart';
import 'package:powerup/ui_screen/power/power_txtbtn.dart';

class GuestBuyScreen extends StatelessWidget {
  const GuestBuyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUiLoginStyle(
      headerMarginTop: 0.0,
      indicatorPadding: 5.h,
      tabIndicatorColor: Colors.white,
      tabbarTxtColor: Colors.white,
      headerBgColor: const Color(0xff082F7C),
      topLogo: 'power_imgs/powerup_translogo.png',
      tabbars: const ['Prepaid', 'Postpaid'],
      tabViewChildren: [prepaid(), postpaid()],
    );
  }

  Widget prepaid() {
    return Container(
      margin: EdgeInsets.only(left: 21.w, right: 21.w),
      child: ScrollConfiguration(
        behavior: PowerScrollBehavior(),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 25.h),
              child: PowerTextField(
                labelTxt: 'Email',
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 25.h),
              child: PowerTextField(
                labelTxt: 'Phone Number',
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 25.h),
              child: PowerTextField(
                labelTxt: 'Disco',
                suffix: IconButton(
                  icon: const Icon(Icons.arrow_drop_down),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 25.h),
              child: PowerTextField(
                labelTxt: 'Meter Number',
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 25.h),
              child: PowerTextField(
                labelTxt: 'Purchase Amount',
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 42.h),
                child: PowerTxtBtn(
                  text: 'Buy Unit',
                  onTap: () {},
                )),
          ],
        ),
      ),
    );
  }

  Widget postpaid() => prepaid();
}
