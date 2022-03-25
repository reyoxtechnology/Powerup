import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/baseui/baseui.dart';
import 'package:powerup/ui_screen/power/power_text.dart';

// ignore: must_be_immutable
class MainBaseUi extends StatelessWidget {

  final String title;
  final Widget child;
  final bool showBackButton;
  final Color? headerBgcolor;
  final double? headerHeight;
  dynamic onTap;
  Color? bgBodyColor;

  MainBaseUi(
      {Key? key,
      required this.title,
      required this.child,
      required this.showBackButton,
      this.headerBgcolor,
      this.onTap,
      this.bgBodyColor,
      this.headerHeight
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(
      bgColor:bgBodyColor ,
        child: Column(
      children: [
        Container(
          height: headerHeight??122.h,
          color: headerBgcolor?? const Color(0xff082F7C),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment :showBackButton?
               MainAxisAlignment.start:
               MainAxisAlignment.center,
              children: [
              showBackButton?  IconButton(
                  onPressed: () => onTap(),
                   icon:const Icon(
                     Icons.arrow_back_outlined,
                     color: Colors.white,
                     )
                   ):
                   const SizedBox(),
                Container(
                margin:showBackButton?
                 EdgeInsets.only(left: 85.0.w):
                 EdgeInsets.zero,
                  child: PowerText(
                    text: title,
                    textAlign: TextAlign.left,
                    fontSize: 25.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Nunito Sans',
                  ),
                ),
               const SizedBox()
              ],
            ),
          ),
          width: MediaQuery.of(context).size.width,
        ),
        Expanded(child: child)
      ],
    ));
  }
}
