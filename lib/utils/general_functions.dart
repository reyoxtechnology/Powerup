import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

goto({required Widget screen, required BuildContext context}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => screen)
      );
}
