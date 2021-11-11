import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:powerup/ui_screen/logins/baseui_loginstyle.dart';
import 'package:powerup/ui_screen/logins/signup_tab.dart';

import 'login_tab.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUiLoginStyle(
      tabViewChildren: [
        LoginTab(),
        SignUpTab()
      ],
    );
  }
}
