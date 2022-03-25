import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerup/ui_screen/power/power_text.dart';

class PowerGrid extends StatelessWidget {
  final String footer;
  final String? header;
  final String? imageUrl;
  final bool doCoverImg;
  final Widget? child;
  const PowerGrid(
      {Key? key,
      required this.footer,
      this.header,
      this.child,
       this.imageUrl,
      required this.doCoverImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      margin: const EdgeInsets.all(2.0),
      child: Card(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: SizedBox(
                    height: 100.h,
                    width: 100.h,
                    child:child?? FittedBox(
                        child: Image.asset(
                      imageUrl!,
                      height: 100.h,
                      width: 100.h,
                      fit: doCoverImg ? BoxFit.cover : BoxFit.fill,
                    ))),
              ),
              Container(
                margin: EdgeInsets.only(left: 2.w, right: 2.w, bottom: 2.h),
                child: Padding(
                  child: PowerText(
                    text: footer,
                    textAlign: TextAlign.center,
                  ),
                  padding: EdgeInsets.all(2.h),
                ),
              ),
            ]),
      ),
    );
  }
}
