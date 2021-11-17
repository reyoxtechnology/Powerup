import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/buyunit/guestbuy_screen.dart';
import 'package:powerup/ui_screen/power/power_cantap.dart';
import 'package:powerup/ui_screen/power/power_text.dart';
import 'package:powerup/ui_screen/ripplebtnwidget.dart';
import 'package:powerup/utils/general_functions.dart';
import '../logins/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  final String? bgImage;

  const WelcomeScreen({Key? key, this.bgImage}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  String? bgImage;
  bool isFirstScreen = true;
  double topPosition = -100.h;
  double txtPosition = -90;
  double swipeupPosition = -200;
  double bottomPosition = -600;
  late Animation<double> animation;
  late AnimationController controller;

  txtAnimation() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 25.h, end: 45.h).animate(controller)
      ..addListener(() {
        setState(() {
          txtPosition = animation.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  changePositon() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        topPosition = 29.h;
        swipeupPosition = 115.h;
        bottomPosition = -127.h;
      });
      txtAnimation();
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
          // if (isFirstScreen) {
          //   setState(() {
          //     isFirstScreen = false;
          //   });
          // }
        },
        child: Stack(
          children: [
            Positioned(
                child: Image.asset(
              isFirstScreen
                  ? 'power_imgs/welcome_bg_img.png'
                  : 'power_imgs/bulb_bg.png',
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            )), //Image.asset('power_imgs/welcome_bg_img.png')
            AnimatedPositioned(
                duration: const Duration(milliseconds: 450),
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
                duration: const Duration(milliseconds: 450),
                left: -20.w,
                bottom: bottomPosition,
                child: Bottom()),
            Positioned(
             // duration: const Duration(milliseconds: 450),
              bottom: txtPosition,
              left: 135.w,
              child: txt(),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 450),
              bottom: swipeupPosition,
              left: 125.w,
              child: PowerCantap(
                  child: const RippleButtonWidget(),
                  onTap: () {
                    goto(
                      screen: const GuestBuyScreen(),
                     context: context);
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
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails details) {
        int sensitivity = 5;
        if (details.delta.dy < -5) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const LoginScreen()));
        }
      },
      child: ClipOval(
        child: Container(
          height: 318.h,
          width: 414.w,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget txt() {
    return const PowerText(
      color: Color(0xFF263238),
      textAlign: TextAlign.center,
      text: 'Swipe up to login',
    );
  }
}
