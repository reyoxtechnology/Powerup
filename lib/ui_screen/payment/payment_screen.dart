import 'package:flutter/material.dart';

import 'package:powerup/ui_screen/baseui/mainbaseui.dart';
import 'package:powerup/ui_screen/power/power_scrollbehaviour.dart';
import 'package:powerup/ui_screen/power/power_text.dart';
import 'package:powerup/ui_screen/power/power_textfield.dart';
import 'package:powerup/ui_screen/power/power_txtbtn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainBaseUi(
      title: 'Payment',
      showBackButton: true,
      child: ScrollConfiguration(
         behavior: PowerScrollBehavior(),
        child: SingleChildScrollView(
          child: Column(children: [
            detail('Cards', 'Add Card'),
            SizedBox(height: 247.h, 
            child: Container(
              margin: EdgeInsets.only(top:34.h,),
              alignment: Alignment.topCenter,
              child: notAvailable('No Cards Available')
            )
            ),
            detail('Promotion', 'Add promo code'),
            SizedBox(height: 247.h,
             child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top:34.h),
               child: notAvailable('No Promos Availble '),
             )
             )
          ]),
        ),
      ),
    );
  }

  void addPromo() {}
  void addCard() {}

  void showAddCardDetails(BuildContext context,bool isPromo){
     showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            content: Container(
              margin: EdgeInsets.only(left:31.w,right:31.w),
          height:  429.h,
          width:  345.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(39.h)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 36.0.h,left:31.w),
                child: PowerText(
                  text:isPromo? 'Pay Amount':'Add Promo code',
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 38.42.h,bottom:11.h),
                width: 253.w,
                height: 60.h,
                child: PowerText(
                  text: isPromo ? 'Card Number' : 'CODE NUMBER',
                  textAlign: TextAlign.center,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 26.42.h,bottom: 35.h),
                child: PowerTextField()
              ),
             isPromo?const SizedBox(): Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Expanded(
                    child: Column(
                      children: [
                       Container(
                         child: const PowerText(text: 'Expiry'),
                         margin: EdgeInsets.only(bottom:11.h ),
                       ),
                        PowerTextField()
                      ]
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom:11.h ),
                          child: const PowerText(text: 'CVV')
                        )
                        ,
                        PowerTextField()
                      ]
                    ),
                  )
                ]
              ),
              Row(
                children:const [
                  Expanded(
                    child: PowerTxtBtn(
                      text:'cancel',
                      txtColor: Color(0xff082F7C),
                      bgColor: Colors.transparent,
                 ),
                  ),
                 Expanded(
                   child:PowerTxtBtn(
                    text:'Save',
                    txtColor:Colors.white,
                    bgColor: Color(0xffE19F21),
                 )
                 )
                ]
              )
            ],
          ),
        ));
      });
  }



  Widget detail(String title, String btnTxt) {
    return Container(
        margin: EdgeInsets.only(left: 19.w, right: 19.w,top:(title=='Cards')?26.h:0.0),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xffDADADA)))),
        child: Container(
          margin: EdgeInsets.only(bottom:10.h),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PowerText(
                  text: title,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                PowerTxtBtn(
                  text: btnTxt,
                  fontSize: 14.sp,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.normal,
                  bgColor: const Color(0xff082F7C),
                  onTap: () {
                    if (title == 'Cards') {
                      addCard();
                    } else {
                      addPromo();
                    }
                  },
                )
              ]),
        )
            );
  }

  Widget notAvailable(String message) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Image.asset('power_imgs/payment_imgs/notavailable.png'),
       PowerText(
        text: message,
        fontSize: 10.sp
        )
    ]);
  }
}
