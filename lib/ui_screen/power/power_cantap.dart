import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PowerCantap extends StatelessWidget {
  final Widget child;
  final dynamic onTap;
  const PowerCantap({Key? key, required this.child, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: child,
      onTap: () {
        // ignore: avoid_print
        print('cantap');
        onTap();
      },
    );
  }
}
