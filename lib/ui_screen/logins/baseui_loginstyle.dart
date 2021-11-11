import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/power/power_text.dart';

class BaseUiLoginStyle extends StatefulWidget {

   final List<Widget>? tabViewChildren ;
   final List<String>? tabbars;
   final String? topLogo;
   BaseUiLoginStyle({
    Key? key,
     this.tabbars,
     this.topLogo,
     this.tabViewChildren
  }) : super(key: key);

  @override
  State<BaseUiLoginStyle> createState() => _BaseUiLoginStyleState();
}

class _BaseUiLoginStyleState extends State<BaseUiLoginStyle>  with TickerProviderStateMixin {

  late TabController tabController;
  late int length;
  late List<Widget>? children;
  late List<String>? tabbars;
  late String? topLogo;
  @override
  void initState() {
    children = widget.tabViewChildren;
    tabbars = widget.tabbars??['Login','Sign-up'];
    length = children?.length??2;
    topLogo = widget.topLogo;
    tabController = TabController(length: length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        children: [
          Container(
            color: Color(0xFFF3F6FA),
            margin: EdgeInsets.only(top: 31.h),
            child:
                Header(),

          ),
         Expanded(
           child: Container(
               child: TabBarView(
                 controller: tabController,
                 children: children??[
                   Container(
                       child:PowerText(text: 'content 1',)
                   ),
                   Container(
                       child:PowerText(text: 'content 2',)
                   )
                 ],
               )
           ),
         )
        ],
      ),

    );
  }

  Widget Header(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Image.asset(
              topLogo ?? 'power_imgs/quickpay_logo.png',
              height: 234.h,
              width: 270.w,
            ),
           Positioned(
             left:112.w,
             top: 23.h,
             child:PowerText(
               text: 'QUICKPAY',
               color: Color(0XFF082F7C),
               fontFamily: 'Poppins',
               fontWeight: FontWeight.bold,
               fontSize: 15.h,
               textAlign: TextAlign.center,
             )
           )
          ],
        )
        ,
       Container(
         margin: EdgeInsets.only(left: 33.w,right: 33.w),
         child: TabBar(
           indicatorColor: Color(0xFF082F7C),
           controller: tabController,
           labelColor: Colors.black,
           tabs:  [
            Container(
              child:PowerText(
                text: tabbars![0],
                fontFamily: 'DM Sans',
                textAlign: TextAlign.left,)
            ) ,
            Container(
              child:PowerText(
                text: tabbars![1],
                fontFamily: 'DM Sans',
                textAlign: TextAlign.right,)
            )
           ]
         ),
       )
      ],
    );
  }
  
  
}
