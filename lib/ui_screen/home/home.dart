import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/baseui/baseui.dart';
import 'package:powerup/ui_screen/buydata/buydata_screen.dart';
import 'package:powerup/ui_screen/notification/notification_screen.dart';
import 'package:powerup/ui_screen/paybills/paybills_screen.dart';
import 'package:powerup/ui_screen/power/power_scrollbehaviour.dart';
import 'package:powerup/ui_screen/power/power_text.dart';
import 'package:powerup/ui_screen/settings/settings_screen.dart';
import 'package:powerup/utils/general_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(
        child: Column(children: [
      bigHeaderWrap(context),
      Expanded(
          child: Container(
        margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.h),
        child: ScrollConfiguration(
          behavior: PowerScrollBehavior(),
          child: GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            children: [
              Card(
                  child: GridTile(
                footer: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: PowerText(
                      text: 'Buy Data',
                      textAlign: TextAlign.center,
                      fontSize: 15.sp),
                ),
                child: IconButton(
                    onPressed: () {
                      goto(screen: const BuyDataScreen(), context: context);
                    },
                    icon: Icon(
                      Icons.wifi,
                      color: Colors.purple,
                      size: 40.h,
                    )),
              )),
              Card(
                  child: GridTile(
                footer: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: PowerText(
                      text: 'Buy Airtime',
                      textAlign: TextAlign.center,
                      fontSize: 15.sp),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.account_balance_wallet,
                      color: Colors.purple,
                      size: 40.h,
                    )),
              )),
              Card(
                  child: GridTile(
                footer: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: PowerText(
                      text: 'Bill Payments',
                      textAlign: TextAlign.center,
                      fontSize: 15.sp),
                ),
                child: IconButton(
                    onPressed: () {
                      goto(screen:const PayBills(), context: context);
                    },
                    icon: Icon(
                      Icons.lightbulb,
                      color: Colors.amber,
                      size: 40.h,
                    )),
              )),
              Card(
                  child: GridTile(
                footer: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: PowerText(
                      text: 'Settings',
                      textAlign: TextAlign.center,
                      fontSize: 15.sp),
                ),
                child: IconButton(
                    onPressed: () {
                      goto(
                          screen: const SettingScreen(
                            emailAddress: 'aikdman7@gmail.com',
                            isReseller: true,
                            name: 'aikd',
                          ),
                          context: context);
                    },
                    icon: Icon(
                      Icons.ac_unit,
                      color: Colors.blue,
                      size: 40.h,
                    )),
              )),
              Card(
                  child: GridTile(
                footer: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: PowerText(
                      text: 'Transfer',
                      textAlign: TextAlign.center,
                      fontSize: 15.sp),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.transfer_within_a_station,
                      color: Colors.green,
                      size: 40.h,
                    )),
              )),
              Card(
                  child: GridTile(
                footer: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: PowerText(
                      text: 'History',
                      textAlign: TextAlign.center,
                      fontSize: 15.sp),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.history,
                      color: Colors.red,
                      size: 40.h,
                    )),
              ))
            ],
          ),
        ),
      ))
    ]));
  }

  Container bigHeaderWrap(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff082F7C),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.h),
              bottomRight: Radius.circular(20.h))),
      height: 323.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 41.h, left: 20.w, right: 20.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [info(), avartarAndNotify(context)],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.h,left: 20.w,bottom: 15.h),
            child: PowerText(
              text: 'N 0.00 ',
              color: Colors.white,
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.w,bottom: 10.h),
              child: const PowerText(
            text: 'Book Balance: N 0.00',
            color: Colors.white,
          )),
          Container(
            margin: EdgeInsets.only(left: 20.w,right:20.w,top: 10.h),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,    
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                child:item(
                  const Icon(Icons.account_balance_wallet,),
                  'Fund Wallet'
                  ),
                 
              ),
            ),
            Container(
              height: 20.h,
               decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.black),
                    )
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                child: item(const Icon(Icons.all_inbox), 'Wallet history'),
              ),
            )
          ]
          ))
        ],
      ),
    );
  }

  Row item(Widget icon, String title) {
    return Row(children: [
      icon,
      PowerText(text: title,color: Colors.black,)
    ]);
  }

  Column info() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PowerText(
          text: 'Good Afternoon,',
          fontWeight: FontWeight.w700,
          fontFamily: 'DM Sans',
          fontSize: 18.sp,
          textAlign: TextAlign.left,
          color: Colors.white,
        ),
        PowerText(
          text: 'Charles!',
          color: Colors.white,
          fontSize: 18.sp,
          fontFamily: 'DM Sans',
          textAlign: TextAlign.left,
        )
      ],
    );
  }

  Row avartarAndNotify(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 15.2.r,
            foregroundColor: Colors.white,
            backgroundImage: const AssetImage('power_imgs/bulb_bg.png'),
            backgroundColor: const Color(0xff082F7C),
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              goto(screen: const NotificationScreen(), context: context);
            },
          )
        ]);
  }
}
