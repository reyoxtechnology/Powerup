import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:powerup/ui_screen/buyunit/buyunit_screen.dart';
import 'package:powerup/ui_screen/buyunit/guestbuy_screen.dart';
import 'package:powerup/ui_screen/logins/baseui_loginstyle.dart';
import 'package:powerup/ui_screen/power/power_cantap.dart';
import 'package:powerup/ui_screen/power/power_text.dart';
import 'package:powerup/ui_screen/power/power_txtbtn.dart';
import 'package:powerup/ui_screen/swipeup_widget.dart';
import 'package:powerup/utils/general_functions.dart';
import '../logins/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  final String? bgImage;

  const WelcomeScreen({Key? key, this.bgImage}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String? bgImage;
  bool isFirstScreen = true;
  double topPosition = -100.h;
  double txtPosition = -100;
  double swipeupPosition = -200;
  double bottomPosition = -600;

  changePositon() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        topPosition = 29.h;
        txtPosition = 30.h;
        swipeupPosition = 92.h;
        bottomPosition = -127.h;
      });
    });
  }

  @override
  void initState() {
    bgImage = widget.bgImage;
    changePositon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: GestureDetector(
        onVerticalDragStart: (DragStartDetails details) {
          if (isFirstScreen) {
            setState(() {
              isFirstScreen = false;
            });
          }
        },
        child: Stack(
          children: [
            Positioned(
                child: Container(
              child: Image.asset(
                isFirstScreen
                    ? 'power_imgs/welcome_bg_img.png'
                    : 'power_imgs/bulb_bg.png',
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            )), //Image.asset('power_imgs/welcome_bg_img.png')
            AnimatedPositioned(
                duration: Duration(milliseconds: 450),
                top: topPosition,
                left: 28.w,
                right: 28.w,
                child: InkWell(
                  onTap: () {
                    if (!isFirstScreen) {
                      setState(() {
                        isFirstScreen = true;
                      });
                    }
                  },
                  child: SizedBox(
                      height: 108.h,
                      child: Image.asset(
                        'power_imgs/powerup_translogo.png',
                      )),
                )),

            // Positioned(
            //   bottom:-127.h,
            //   child: BottomWidget()
            // )

            AnimatedPositioned(
                duration: Duration(milliseconds: 450),
                left: -20.w,
                bottom: bottomPosition,
                child: Bottom()),
            AnimatedPositioned(
              duration: Duration(milliseconds: 450),
              bottom: txtPosition,
              left: 106.w,
              child: Txt(),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 450),
              bottom: swipeupPosition,
              left: 115.w,
              child: PowerCantap(
                  child: const SwipeUpWidget(),
                  onTap: () {
                    goto(screen: const GuestBuyScreen(), context: context);
                  }),
            )
          ],
        ),
      ),
    );
  }

  // Widget BottomWidget(){
  //   return Stack(
  //     children: [
  //       Positioned(
  //         child:Bottom()
  //       ),
  //       Positioned(
  //         left:135.w,
  //         bottom:219.h,
  //         child:PowerCantap(
  //                 child: const SwipeUpWidget(),
  //                 onTap: () {
  //                   goto(
  //                     screen: const GuestBuyScreen(),
  //                      context: context);
  //                 }
  //       ))
  //     ]
  //   );
  // }

  Widget Bottom() {
    return ClipOval(
      child: Container(
        height: 318.h,
        width: 414.w,
        color: Colors.white,
      ),
    );
  }

  Widget Txt() {
    return Container(
      child: PowerTxtBtn(
        bgColor: Colors.transparent,
        txtColor: const Color(0xFF263238),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const LoginScreen()));
        },
        text: 'Swipe up to login',
      ),
    );
  }
}
