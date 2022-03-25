
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/power/power_text.dart';
import 'package:powerup/ui_screen/power/power_txtbtn.dart';

goto({required Widget screen, required BuildContext context}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
}

pop(BuildContext context) {
  Navigator.of(context).pop();
}

void showDialogBox(BuildContext context, {double? height, double? width}) {
  showDialog(
      context: context,
    
      builder: (context) {
        return AlertDialog(
            content: Container(
          height: height ?? 463.h,
          width: width ?? 315.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(39.h)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 57.71.h),
                child: tempWidget(),
              ),
              Container(
                margin: EdgeInsets.only(top: 26.42.h,left:31.w,right:31.w),
                width: 253.w,
                height: 60.h,
                child: PowerText(
                  text: 'Your password has been reset',
                  textAlign: TextAlign.center,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 26.42.h),
                width: 263.w,
                height: 20.h,
                child: PowerText(
                  text: 'You\'re welcome again',
                  textAlign: TextAlign.center,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 64.0.h),
                width: 263.w,
                child: PowerTxtBtn(
                  text: 'Done',
                  textAlign: TextAlign.center,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  onTap: () => pop(context),
                  borderRadius: 39.r,
                  bgColor:const Color(0xFFE19F21),
                ),
              ),
            ],
          ),
        ));
      });
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
