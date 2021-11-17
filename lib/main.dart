import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/buydata/buydata_screen.dart';
import 'package:powerup/ui_screen/buyunit/buyunit_screen.dart';
import 'package:powerup/ui_screen/buyunit/guestbuy_screen.dart';
import 'package:powerup/ui_screen/forgotpassword/forgot_pwd_screen.dart';
import 'package:powerup/ui_screen/home/home.dart';
import 'package:powerup/ui_screen/notification/notification_screen.dart';
import 'package:powerup/ui_screen/paybills/paybills_screen.dart';
import 'package:powerup/ui_screen/payment/payment_screen.dart';
import 'package:powerup/ui_screen/settings/settings_screen.dart';
import 'package:powerup/ui_screen/uicontroller/uicontroller.dart';
import 'package:powerup/ui_screen/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WelcomeScreen()  
          //UiController()
          //HomeScreen()
          //PayBills()
          //PaymentScreen()
          //BuyDataScreen()
          // BuyUnitScreen()
          //  SettingScreen(
          //   name: 'aikd',
          //    emailAddress: 'aikdman7@gmail.com',
          //     isReseller: true) // WelcomeScreen(),
        );
      },
    );
  }
}
