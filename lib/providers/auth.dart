// @dart=2.9
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../utils/app_url.dart';
import '../utils/shared_preference.dart';


enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider with ChangeNotifier {

  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;


  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    //final Map<String, dynamic> 

    _loggedInStatus = Status.Authenticating;
    notifyListeners();
 
    final response = await http.post(
      AppUrl().login,
      body: {
        'email': email,
        'password': password,
        'device_name': await getDeviceId(),
    },
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var userData = responseData['user'];
      User authUser = User.fromJson(userData);
      UserPreferences().saveUser(authUser);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': "Error! check your email or password." //"json.decode(response.body)['error']"
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> register(String fullName, String email, String password) async {

    return await http.post(AppUrl().register,
        body: {
        'email': email,
        'password': password,
        'name': fullName,
        'device_name': await getDeviceId(),
    },
        headers: {'Accept': 'application/json'}) 
        .then(onValue)
        .catchError(onError);
  } 

  static Future<FutureOr> onValue(http.Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {

      var userData = responseData['user'];

      User authUser = User.fromJson(userData);

      UserPreferences().saveUser(authUser);
      result = {
        'status': true,
        'message': 'Successfully registered. Please check your email for a 6-digit pin to verify your email.',
        'user': authUser
      };
    } else {
      result = {
        'status': false,
        'message': 'Registration failed',
        'user': responseData
      };
    }

    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'user': error};
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