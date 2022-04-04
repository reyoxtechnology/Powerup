import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/buyunit/buyunit_screen.dart';
import 'package:powerup/ui_screen/home/home.dart';
import 'package:powerup/ui_screen/payment/payment_screen.dart';
import 'package:powerup/ui_screen/power/powerbottomnavbar.dart';
import 'package:powerup/ui_screen/settings/settings_screen.dart';

import '../payment/fund-wallet.dart';

class UiController extends StatefulWidget {
  const UiController({Key? key}) : super(key: key);

  @override
  _UiControllerState createState() => _UiControllerState();
}

class _UiControllerState extends State<UiController> {
  int currentIndex = 0;

  late List<Widget> allWidget;

  @override
  void initState() {
    allWidget = [
     const HomeScreen(),
      Container(),
      const BuyUnitScreen(),
      const FundWallet(),
      //const PaymentScreen(),
      const SettingScreen(
          name: 'aikd',
           emailAddress: 'aikdman7@gmail.com', 
           isReseller: true
           )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: PowerBottomNavBar(
          currentIndex: currentIndex,
          onTapItem: (onTapItem) {
            setState(() {
              currentIndex = onTapItem;
            });
          }),
      body: allWidget[currentIndex],
      floatingActionButton: fab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

Widget fab() {
  return Stack(
    alignment: Alignment.center,
    children: [
    Container(
      width: 60.h,
      height: 60.h,
      decoration:const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffE19F21)
      ),
    ),
    Image.asset('power_imgs/light_icon.png',height: 28.h,width: 28.w,fit: BoxFit.contain,)
  ]);
}
