// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/services/email_password_reset.dart';
import 'package:powerup/ui_screen/welcome/welcome_screen.dart';
import './providers/auth.dart';
import './providers/user_provider.dart';
import './utils/shared_preference.dart';
import './models/user.dart';
import './ui_screen/home/home.dart';
import './ui_screen/payment/fund-wallet.dart';
import './ui_screen/logins/login_screen.dart';

import 'package:provider/provider.dart';

import 'providers/wallet_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future<User> getUserData() => UserPreferences().getUser();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => EmailVerifyPasswordReset()),
        ChangeNotifierProvider(create: (_) => WalletProvider()),
      ],
      child: FutureBuilder(
      future: getUserData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return _homeScreen();
          default:
            return _welcomeScreen(); //_fundWallet(); //
        }

        },
        ),
      );
  }
}

Widget _fundWallet(){
  return ScreenUtilInit(
  designSize: const Size(375, 812),
  builder: () {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FundWallet(),
    );
  },
);
}

Widget _homeScreen(){
  return ScreenUtilInit(
  designSize: const Size(375, 812),
  builder: () {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  },
);
}

Widget _welcomeScreen(){
  return ScreenUtilInit(
  designSize: const Size(375, 812),
  builder: () {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  },
);
}

Widget _loginScreen(){
  return ScreenUtilInit(
  designSize: const Size(375, 812),
  builder: () {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  },
);
}



// ScreenUtilInit(
//         designSize: const Size(375, 812),
//         builder: () {
//           return const MaterialApp(
//             debugShowCheckedModeBanner: false,
//             home: (){ return  const WelcomeScreen();},

//             );
//         },
//           );