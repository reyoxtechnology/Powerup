import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:powerup/ui_screen/logins/baseui_loginstyle.dart';
import 'package:powerup/ui_screen/power/power_text.dart';
import 'package:powerup/ui_screen/power/power_txtbtn.dart';
import 'package:powerup/ui_screen/swipeup_widget.dart';
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

  @override
  void initState() {
    bgImage = widget.bgImage;
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

            Positioned(
                top: 29.h,
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
            Positioned(left: -20.w, top: 621.h, child: Bottom()),
            Positioned(
              top: 743.h,
              left: 106.w,
              child: Txt(),
            ),
            Positioned(
              top: 556.h,
              left: 115.w,
              child: const SwipeUpWidget(),
            )
          ],
        ),
      ),
    );
  }

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
