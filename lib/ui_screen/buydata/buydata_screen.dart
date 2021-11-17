import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/baseui/mainbaseui.dart';
import 'package:powerup/ui_screen/power/power_cantap.dart';
import 'package:powerup/ui_screen/power/power_grid.dart';
import 'package:powerup/ui_screen/power/power_scrollbehaviour.dart';
import 'package:powerup/ui_screen/power/power_text.dart';

class BuyDataScreen extends StatelessWidget {
  const BuyDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainBaseUi(
        title: 'Buy Data',
        showBackButton: true,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 26.h),
                child: const PowerText(text: 'select network')),
            Expanded(
              child: Container(
                color:const Color(0xffE5E5E5),
                margin: EdgeInsets.only(left: 4.w, right: 4.w, top: 40.h),
                child: ScrollConfiguration(
                  behavior: PowerScrollBehavior(),
                  child: GridView(
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    children: [
                      PowerCantap(
                          child: const PowerGrid(
                            doCoverImg: true,
                            footer: '9Mobile Data',
                            imageUrl: 'power_imgs/buydata_imgs/9mobile.jpeg',
                          ),
                          onTap: () {
                            // ignore: avoid_print
                            print('goto 9mobile');
                          }),
                      PowerCantap(
                          child: const PowerGrid(
                              footer: 'airtel data',
                              doCoverImg: true,
                              imageUrl: 'power_imgs/buydata_imgs/airtel.jpeg'),
                          onTap: () {
                            // ignore: avoid_print
                            print('goto airtel data');
                          }),
                      PowerCantap(
                          child: const PowerGrid(
                              footer: 'glo data',
                              doCoverImg: true,
                              imageUrl: 'power_imgs/buydata_imgs/glo.jpeg'),
                          onTap: () {
                            // ignore: avoid_print
                            print('goto glo data');
                          }),
                      PowerCantap(
                          child: const PowerGrid(
                              footer: 'Mtn data',
                              doCoverImg: true,
                              imageUrl: 'power_imgs/buydata_imgs/mtn.jpeg'),
                          onTap: () {
                            // ignore: avoid_print
                            print('goto mtn data');
                          }),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
