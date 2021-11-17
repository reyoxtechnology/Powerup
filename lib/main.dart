import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
