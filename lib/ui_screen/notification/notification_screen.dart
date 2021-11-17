import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/baseui.dart';
import 'package:powerup/ui_screen/power/power_cantap.dart';
import 'package:powerup/ui_screen/power/power_text.dart';
import 'package:powerup/utils/general_functions.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          elevation: 0.3,
          backgroundColor: Colors.white,
          title:  PowerText(
            text: 'Notifications',
            fontSize: 28.sp,
            color:const Color(0xFF383838),
            ),
          leading: IconButton(
            onPressed: () {
              pop(context);
            },
            color:const Color(0xFF383838),
            icon: const Icon(
              Icons.arrow_back,
              color:const Color(0xFF383838) ,
              ),
          ),
          actions: [
            IconButton(onPressed: (){},
             icon:const Icon(
               CupertinoIcons.ellipsis_vertical,
             color: const Color(0xFF383838),
             )
             )
          ],
        ),
        child: Container(
          margin: EdgeInsets.only(top: 66.h),
          child: Column(children: [
            Container(
                margin: EdgeInsets.only(top: 66.h),
                
                child: Image.asset('power_imgs/notify.png')),
            Container(
                margin: EdgeInsets.only(top: 33.6.h),
                child: PowerText(
                  text: 'Notification Empty',
                  color: const Color(0xFF383838),
                  fontFamily: 'Nunito Sans',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                )),
            Container(
                margin: EdgeInsets.only(top: 20.h, left: 27.w, right: 27.w),
                width: 321.w,
                child: PowerText(
                  text:
                      'There are no notifications in this account, let’s discover and take a look this later.',
                  textAlign: TextAlign.center,
                  fontSize: 16.sp,
                  color: const Color(0xCC383838),
                  fontWeight: FontWeight.w400,
                  lineHeight: 1.5.sp,
                ))
          ]),
        ));
  }
}
