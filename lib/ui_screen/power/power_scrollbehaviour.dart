import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/monodrag.dart';

class PowerScrollBehavior extends ScrollBehavior {
  
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    // TODO: implement buildViewportChrome
    return child;
  }
}
