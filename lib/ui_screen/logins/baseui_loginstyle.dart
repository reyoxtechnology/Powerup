import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/power/power_text.dart';

class BaseUiLoginStyle extends StatefulWidget {
  final List<Widget>? tabViewChildren;
  final List<String>? tabbars;
  final String? topLogo;
  final Color? headerBgColor;
  final double? headerMarginTop;
  final Color? tabbarTxtColor;
  final Color? tabIndicatorColor;
  final double? indicatorPadding;
  BaseUiLoginStyle(
      {Key? key,
      this.tabbars,
      this.topLogo,
      this.tabViewChildren,
      this.headerBgColor,
      this.headerMarginTop,
      this.tabbarTxtColor,
      this.tabIndicatorColor,
      this.indicatorPadding})
      : super(key: key);

  @override
  State<BaseUiLoginStyle> createState() => _BaseUiLoginStyleState();
}

class _BaseUiLoginStyleState extends State<BaseUiLoginStyle>
    with TickerProviderStateMixin {
  late TabController tabController;
  late int length;
  late List<Widget>? children;
  late List<String>? tabbars;
  late String? topLogo;
  late Color? headerBgColor;
  late double? headerMarginTop;
  late Color? tabbarTxtColor;
  late Color? indicatorColor;
  late double? indicatorPadding;
  @override
  void initState() {
    children = widget.tabViewChildren;
    tabbars = widget.tabbars ?? ['Login', 'Sign-up'];
    length = children?.length ?? 2;
    topLogo = widget.topLogo;
    headerBgColor = widget.headerBgColor;
    headerMarginTop = widget.headerMarginTop;
    tabbarTxtColor = widget.tabbarTxtColor;
    indicatorColor = widget.tabIndicatorColor;
    indicatorPadding = widget.indicatorPadding;
    tabController = TabController(length: length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        children: [
          Container(
            color: headerBgColor ?? const Color(0xFFF3F6FA),
            margin: EdgeInsets.only(top: headerMarginTop ?? 31.h),
            child: Header(),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: children ??
                  [
                    const PowerText(
                      text: 'content 1',
                    ),
                    const PowerText(
                      text: 'content 2',
                    )
                  ],
            ),
          )
        ],
      ),
    );
  }

  Widget Header() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Image.asset(
              topLogo ?? 'power_imgs/power_dark_logo.jpeg',
              height: 234.h,
              width: 270.w,
            ),
            // Positioned(
            //     left: 112.w,
            //     top: 23.h,
            //     child: PowerText(
            //       text: 'QUICKPAY',
            //       color:const Color(0XFF082F7C),
            //       fontFamily: 'Poppins',
            //       fontWeight: FontWeight.bold,
            //       fontSize: 15.h,
            //       textAlign: TextAlign.center,
            //     ))
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 33.w, right: 33.w),
          child: TabBar(
              indicatorColor: indicatorColor ?? const Color(0xFF082F7C),
               labelPadding:  (indicatorPadding ==  null)?
              EdgeInsets.zero: 
              EdgeInsets.all(indicatorPadding!),
              indicatorPadding: (indicatorPadding ==  null)?
              EdgeInsets.zero: 
              EdgeInsets.all(indicatorPadding!),
              controller: tabController,
              labelColor: Colors.black,
              tabs: [
                PowerText(
                  text: tabbars![0],
                  fontFamily: 'DM Sans',
                  textAlign: TextAlign.left,
                  color: tabbarTxtColor,
                ),
                PowerText(
                  text: tabbars![1],
                  fontFamily: 'DM Sans',
                  textAlign: TextAlign.right,
                  color: tabbarTxtColor,
                )
              ]),
        )
      ],
    );
  }
}
