import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class RippleButtonWidget extends StatelessWidget {
  const RippleButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.center,
      children:[

        RippleAnimation(
          color:const Color(0x73E5A021),
          repeat:true,
          ripplesCount:1,
          minRadius: 144.h/2,
          child:Container(
          height: 144.h,
          width: 144.h,
          decoration: BoxDecoration(
         // color:Color(0x73E5A021),
          shape: BoxShape.circle,
        )) ,

        )
        ,


    RippleAnimation(
      ripplesCount: 1,
      color:Color(0x73E5A021),
      repeat: true,
      minRadius: 123.h/2, 
      child:Container(
         height: 123.h,
         width: 123.h,
         decoration: BoxDecoration(
          // color: Color(0x80E39E1F),
           shape: BoxShape.circle,
         ))
    )
   ,


    Container(
    height: 99.h,
    width: 99.h,
    decoration: BoxDecoration(
    color: Color(0xFFE19F21),
    shape: BoxShape.circle,
    ),),


        Container(
          height:43.h ,
          width:43.h ,
          child: Image.asset(
              'power_imgs/light_icon.png',
              height: 43.h,
              width: 43.h,
              fit:BoxFit.cover
          )
        )

    ]
    );
  }
}
