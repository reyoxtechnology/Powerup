import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:powerup/ui_screen/baseui/mainbaseui.dart';
import 'package:powerup/ui_screen/power/power_text.dart';
import 'package:powerup/ui_screen/power/power_txtbtn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainBaseUi(
      title: 'Payment',
      showBackButton: true,
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
    );
  }

  void addPromo() {}
  void addCard() {}

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
