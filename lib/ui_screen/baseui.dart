import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BaseUi extends StatelessWidget {
  final Widget child;
  final Color? bgColor;
  const BaseUi({Key? key, required this.child,this.bgColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: bgColor,
        body: Container(
          child: child,
        ));
  }
}
