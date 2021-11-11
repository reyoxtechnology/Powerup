import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BaseUi extends StatelessWidget {
  final Widget child;

  const BaseUi({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          child: child,
        ));
  }
}
