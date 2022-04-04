import 'dart:async';
import 'package:flutter/material.dart';

class WalletProvider extends ChangeNotifier {

  bool _walletStatus = false;
  bool _inProgress = false;

  bool get inProgress => _inProgress;
  bool get walletStatus => _walletStatus;

   setStatus(bool value) {
    _walletStatus = value;
    notifyListeners();
  }

  setProgresss(bool value) {
    _inProgress = value;
    notifyListeners();
  }

  Future<Map<String, dynamic>> createUserWallet(String token) async {
    bool status = false;
    bool result = true;

    if(result == true){
      status = true;
      setStatus(result);
      setProgresss(false);
      return {};
    } 
    setProgresss(false);
    return {};
  }

  Future<bool> getUserWallet(String token) async {
    bool status = false;
    bool result = false;

    print('== getUserWallet ==');
    print(token);
    
    if(result == true){
      status = true;
      setStatus(result);
      setProgresss(false);
     // notifyListeners();
      return status;
    } else {
      setProgresss(false);
      //notifyListeners();
      return status;
    }
  }

  Future<Map<String, dynamic>> addFunWallet(String token) async {
    return {};
  }

  Future<Map<String, dynamic>> getWalletHistory(String token) async {
    return {};
  }

}