import 'package:flutter/material.dart';

import 'package:powerup/ui_screen/power/power_text.dart';

class BaseUi extends StatelessWidget {
  final Widget child;
  final Color? bgColor;
  final bool? extendBodyBehindAppBar;
  final AppBar? appBar;

  const BaseUi({
    Key? key,
    required this.child,
    this.bgColor,
    this.extendBodyBehindAppBar,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        extendBodyBehindAppBar: extendBodyBehindAppBar??true,
        backgroundColor: bgColor,
        body: child
        );
  }
}
