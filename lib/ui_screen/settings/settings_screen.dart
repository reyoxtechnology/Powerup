import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/baseui/baseui.dart';
import 'package:powerup/ui_screen/power/power_scrollbehaviour.dart';
import 'package:powerup/ui_screen/power/power_text.dart';

class SettingScreen extends StatefulWidget {
  final String name;
  final String emailAddress;
  final bool isReseller;

  const SettingScreen(
      {Key? key,
      required this.name,
      required this.emailAddress,
      required this.isReseller})
      : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late final String name;
  late final String emailAddress;
  late bool isReseller;

  @override
  void initState() {
    name = widget.name;
    emailAddress = widget.emailAddress;
    isReseller = widget.isReseller;
    super.initState();
  }

  void onChanged(bool value) {
    setState(() {
      isReseller = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseUi(
      child: Container(
          margin: EdgeInsets.only(top: 56.h),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                header(),
                Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 15.w,right: 15.w),
                      child: ScrollConfiguration(
                        behavior: PowerScrollBehavior(),
                        child: ListView(
                  children: [
                        Container(
                          decoration: const BoxDecoration(
                            border:Border(bottom:BorderSide( 
                            color:Color(0xffDFE2E4)
                              ) )
                          ),
                          child: ListTile(
                            title: PowerText(
                              text: 'Profile',
                              fontSize: 18.sp,
                            ),
                          ),
                        ),


                        Container(
                          decoration: const BoxDecoration(
                            border:Border(bottom:BorderSide( 
                            color:Color(0xffDFE2E4)
                              ) )
                          ),
                          child: ListTile(
                            title: PowerText(text: 'Security', fontSize: 18.sp),
                          ),
                        ),

                        Container(
                          decoration: const BoxDecoration(
                            border:Border(bottom:BorderSide( 
                            color:Color(0xffDFE2E4)
                              ) )
                          ),
                          child: ListTile(
                            title: PowerText(text: 'Manage Meters', fontSize: 18.sp),
                          ),
                        ),

                        Container(
                          decoration: const BoxDecoration(
                            border:Border(bottom:BorderSide( 
                            color:Color(0xffDFE2E4)
                              ) )
                          ),
                          child: ListTile(
                            title: PowerText(text: 'Reseller', fontSize: 18.sp),
                            trailing: SizedBox(
                              width:68.w,
                              height:32.h,
                              child:FittedBox(
                                child:CupertinoSwitch(
                                value: isReseller,
                                 onChanged: onChanged,
                                 activeColor: const Color(0xff082F7C)
                                 ),
                              )
                            )
                                 ),
                        ),
                        
                        Container(
                          decoration: const BoxDecoration(
                            border:Border(bottom:BorderSide( 
                            color:Color(0xffDFE2E4)
                              ) )
                          ),
                          child: ListTile(
                            title: PowerText(text: 'Logout', fontSize: 18.sp),
                          ),
                        ),
                  ],
                ),
                      ),
                    )
                )
              ])),
    );
  }

  Widget header() {
    return Container(
      height: 240.h,
      width: 343.w,
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Stack(
       alignment: Alignment.center,
        children: [
         Image.asset(
           'power_imgs/settings_headerBg.png',
           height: 240.h,
           width: 343.w,
           fit: BoxFit.fill,
         ) ,
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top:33.h,
                  bottom:70.h ),
                child: PowerText(
                  text: 'Settings',
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 24.sp,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w,right: 10.w),
                child: PowerText(
                  text: name,
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                 margin: EdgeInsets.only(left: 10.w,right: 10.w),
                child: PowerText(
                  text: emailAddress,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontFamily: 'Nunito Sans',
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
