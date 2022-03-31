import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import '../utils/app_url.dart';
import '../utils/shared_preference.dart';

class EmailVerifyPasswordReset  with ChangeNotifier {

  Future<Map<String, dynamic>> forgotPassword(String email) async {
    var result;

    final response = await http.post(
      AppUrl().forgotPassword,
      body: {
         'email': email,
         'device_name': await getDeviceId(),
    },
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      result = {'status': true, 'message': 'Successful'};
       UserPreferences().setEmail(email);
      notifyListeners();
    } else {
      result = {
        'status': false,
        'message': "Error! check your email or password." //"json.decode(response.body)['error']"
      };
      notifyListeners();
    }
    return result;
  }

    Future<Map<String, dynamic>> resetPasswordPin(String token) async {
    var result;
    final email = await UserPreferences().getEmail();

    final response = await http.post(
      AppUrl().resetPasswordPin,
      body: {
         'email': email,
         'token': token,
         'device_name': await getDeviceId(),
    },
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {

    //final Map<String, dynamic> resData = json.decode(response.body);
      result = {'status': true, 'message': 'You can now reset your password'};
      notifyListeners();
    } else {
      result = {
        'status': false,
        'message': 'Invalid token', //"json.decode(response.body)['error']"
      };
      notifyListeners();
    }
    return result;
  }

    Future<Map<String, dynamic>> setNewPassword(String password) async {
    var result;
    final email = await UserPreferences().getEmail();

    final response = await http.post(
      AppUrl().setNewPassword,
      body: {
         'email': email,
         'password': password,
         'device_name': await getDeviceId(),
    },
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {

    //final Map<String, dynamic> resData = json.decode(response.body);
      result = {'status': true, 'message': 'Your password has been reset'};
      notifyListeners();
    } else {
      result = {
        'status': false,
        'message': 'Invalid token', //"json.decode(response.body)['error']"
      };
      notifyListeners();
    }
    return result;
  }

    Future<Map<String, dynamic>> verifyEmail(String token) async {
    var result;
    final email = await UserPreferences().getEmail();

    final response = await http.post(
      AppUrl().verifyEmail,
      body: {
         'email': email,
         'token': token,
         'device_name': await getDeviceId(),
    },
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {

    //final Map<String, dynamic> resData = json.decode(response.body);
      result = {'status': true, 'message': 'You can now reset your password'};
      notifyListeners();
    } else {
      result = {
        'status': false,
        'message': 'Invalid token', //"json.decode(response.body)['error']"
      };
      notifyListeners();
    }
    return result;
  }

  getDeviceId() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        return build.androidId;
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        return data.identifierForVendor;
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
  }

}