import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:powerup/ui_screen/power/power_text.dart';

class PowerBtn extends StatelessWidget {
  final Color? btnColor;
  final Color? txtColor;
  final String text;
  final dynamic? onTap;

  const PowerBtn({Key? key,
    this.txtColor,
    this.onTap,
    required this.text,
    this.btnColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

        onPressed: (){
          if(onTap!=null){
            this.onTap();
          }
        },
        child: PowerText(text: text)
    );
  }
}
