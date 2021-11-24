import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/enums/billing_method.dart';
import 'package:powerup/ui_screen/baseui/mainbaseui.dart';
import 'package:powerup/ui_screen/buyunit/guestbuy_screen.dart';
import 'package:powerup/ui_screen/power/power_scrollbehaviour.dart';
import 'package:powerup/ui_screen/power/power_text.dart';
import 'package:powerup/ui_screen/power/power_textfield.dart';
import 'package:powerup/ui_screen/power/power_txtbtn.dart';
import 'package:powerup/utils/general_functions.dart';

class BuyUnitScreen extends StatefulWidget {
  const BuyUnitScreen({Key? key}) : super(key: key);

  @override
  State<BuyUnitScreen> createState() => _BuyUnitState();
}

class _BuyUnitState extends State<BuyUnitScreen> {
  BillingMethod billingMethod = BillingMethod.Prepaid;

  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MainBaseUi(
      title: 'Buy Units',
       child:  Container(
         margin: EdgeInsets.only(left: 31.w, right: 31.w),
         child: ScrollConfiguration(
           behavior: PowerScrollBehavior(),
           child: ListView(
             shrinkWrap: true,
             physics: const AlwaysScrollableScrollPhysics(),
             children: [
               Container(
                 margin: EdgeInsets.only(top: 16.h, bottom: 12.h),
                 child: const PowerText(
                   text: 'Billing Method',
                   fontWeight: FontWeight.w500,
                 ),
               ),
               billingType(),
               Container(
                   margin: EdgeInsets.only(top: 24.h, bottom: 9.h),
                   child: PowerText(
                     text: 'Enter District',
                     color:const Color(0xff1F1F1F),
                     textAlign: TextAlign.left,
                     fontSize: 18.sp,
                   )),
               PowerTextField(
                 suffix: IconButton(
                     onPressed: () {},
                     icon: const Icon(
                       Icons.arrow_drop_down_outlined,
                       color: Color(0xff1F1F1F),
                     )),
               ),
               Container(
                   margin: EdgeInsets.only(top: 21.h, bottom: 9.h),
                   child: PowerText(
                     text: 'Enter Meter Number',
                     color: const Color(0xff1F1F1F),
                     fontSize: 18.sp,
                   )),
               PowerTextField(),
               Container(
                   margin: EdgeInsets.only(top: 21.h, bottom: 9.h),
                   child: PowerText(
                     text: 'Purchase Amount',
                     color: const Color(0xff1F1F1F),
                     fontSize: 18.sp,
                   )),
               PowerTextField(
                 textInputType: TextInputType.number,
               ),
               Container(
                 width: 312.w,
                 margin: EdgeInsets.only(
                   top: 20.h,
                   bottom: 15.h,
                 ),
                 child: PowerTxtBtn(
                   bgColor: const Color(0xFFE19F21),
                   text: 'Continue',
                   onTap: () =>
                       goto(screen:const GuestBuyScreen(), context: context),
                 ),
               ),
               Container(
                 color: const Color(0xffF3F6FA),
                 height: 4.h,
                 width: 394.w,
               ),
               Container(
                 margin: EdgeInsets.only(top: 57.h),
                 child: const Center(
                   child: PowerText(
                     text: 'no recent record!',
                     textAlign: TextAlign.center,
                     fontWeight: FontWeight.w700,
                   ),
                 ),
               )
             ],
           ),
         ),
       ), 
       showBackButton: false);
    
  }

  Widget billingType() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_prepaidRadio(), _postpaidRadio()],
    );
  }

  Row _prepaidRadio() {
    return Row(
      children: [
        Radio<BillingMethod>(
            splashRadius: 3.5.h,
            fillColor:
                MaterialStateProperty.all<Color>(const Color(0xff082F7C)),
            value: BillingMethod.Prepaid,
            groupValue: billingMethod,
            onChanged: (BillingMethod? method) {
              setState(() {
                billingMethod = method!;
              });
            }),
        Container(
          margin: EdgeInsets.only(right: 19.w),
          child: PowerText(
            text: 'Pre-Paid',
            fontSize: 14.sp,
          ),
        )
      ],
    );
  }

  Row _postpaidRadio() {
    return Row(
      children: [
        Radio<BillingMethod>(
            splashRadius: 3.5.h,
            fillColor:
                MaterialStateProperty.all<Color>(const Color(0xff082F7C)),
            value: BillingMethod.Postpaid,
            groupValue: billingMethod,
            onChanged: (BillingMethod? method) {
              setState(() {
                billingMethod = method!;
              });
            }),
        Container(
          child: PowerText(
            text: 'Post-Paid',
            fontSize: 14.sp,
          ),
          margin: EdgeInsets.only(right: 19.w),
        )
      ],
    );
  }
}
