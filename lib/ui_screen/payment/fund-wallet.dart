import 'dart:async';
import 'dart:io';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/common.dart';
import '../../utils/app_url.dart';
import '../../utils/shared_preference.dart';
// ignore: import_of_legacy_library_into_null_safe
import '../../utils/constants.dart';
import '../baseui/baseui.dart';
import '../baseui/mainbaseui.dart';
import '../power/power_scrollbehaviour.dart';
import '../../models/wallet.dart';
import '../../providers/wallet_provider.dart';
import '../power/power_text.dart';
import '../power/power_textfield.dart';
import 'add-fund-wallet.dart';

class FundWallet extends StatefulWidget {   
  const FundWallet({Key? key}) : super(key: key);

  @override
  _FundWalletState createState() => _FundWalletState();
}

class _FundWalletState extends State<FundWallet> {

   bool _inProgress = false;

    late TextEditingController _fundAmount;
    final _formKey = GlobalKey<FormState>();
    //String _fundAmount;

    @override
    void initState() {
    super.initState();
    _fundAmount = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    //print('== token ==');
    //print(token);
    return MainBaseUi(
        title: 'Fund Wallet',
        bgBodyColor: const Color(0xFFE5E5E5),
        showBackButton: true,
        onTap: () => Navigator.of(context).pop(),
        child: ScrollConfiguration(
          behavior: PowerScrollBehavior(),
          child: SingleChildScrollView(
            child: Consumer<WalletProvider>(
              builder: (context, wallet, child) {
                switch (wallet.walletStatus) {
                  case true:
                    return _addFundWallet(context, _formKey, _fundAmount);
                  default:
                    return wallet.inProgress
                          ? Container(
                              alignment: Alignment.center,
                              height: 50.0,
                              child: Platform.isIOS
                                  ? const CupertinoActivityIndicator()
                                  : const CircularProgressIndicator(),
                            )
                          : _createWallet(context);
                }
              },
            )
            ),
          ),
    );
  }
  
}

Widget _addFundWallet(context, _formKey, _fundAmount){
  double walletBalance = 100.0;
  var navData;
  double selectAmount = 0.0;
  return Form(
    key: _formKey,
    child: Container(
    padding: const EdgeInsets.all(30.0),
    margin: const EdgeInsets.only(top: 26.0),
    child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Add Fund to your Wallet', 
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              const Text(
              'Wallet Balance', 
              style: TextStyle(fontSize: 24.0),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
              ),
              RichText(text: TextSpan(
                text: 'N ',
                style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xff000000), fontSize: 28.0),
                children: <TextSpan>[
                  TextSpan(text: walletBalance.toString()),
                ],
              ),
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 10.0, top:30.0),
                  child: const PowerText(
                    text: 'Enter Amount',
                    fontSize: 16.0,
                    color: Color(0xff979797),
                  )),
              PowerTextField(
                //textInputType: TextInputType.number,
                onChange: (value) => _fundAmount = value,
                textInputType: 
                const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 38.0),
              MaterialButton(
                textColor: Colors.white,
                height: 50.00,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                      ),
                ),
                color: const Color(0xFFE19F21), //Colors.green,
                child: const Text('Fund Wallet', 
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                ),
                onPressed: () => _goToPaystack(context, _fundAmount, selectAmount, walletBalance),
              ),
          ],),),
  ),
  );
}

_goToPaystack(context, _fundAmount, selectAmount, walletBalance) {
    try {
        selectAmount = double.parse(_fundAmount.toString());
        if(selectAmount < 100.0){
                Flushbar(
              title: "Low Amount",
              message: 'Please Enter Min of N100',
              duration: const Duration(seconds: 3),
            ).show(context);
            return false;
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  AddFundWallet(selectAmount: selectAmount, walletBalance: walletBalance),
          ));
        }

    } catch(e){
      print(e);
      Flushbar(
          title: "Wrong Inputs",
          message: 'Please Enter Valid Numbers',
          duration: const Duration(seconds: 3),
        ).show(context);
    }
  }

Widget _createWallet(context){
  return Container(
    padding: const EdgeInsets.all(30.0),
    margin: const EdgeInsets.only(top: 26.0),
    child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Click below to Create your Wallet', 
              style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 12.0),
              MaterialButton(
                textColor: Colors.white,
                height: 50.00,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                      ),
                ),
                color: const Color(0xFFE19F21), //Colors.green,
                child: const Text('Create Wallet', 
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                ),
                onPressed: () => _createWalletFunc(context),
              ),
          ],),),
  );
}


 Future<void>  _createWalletFunc(context) async {
  
  final String  token = await UserPreferences().getToken();//.then((value) =>  value);
  
  WalletProvider wallet = Provider.of<WalletProvider>(context,listen: false);
  wallet.setProgresss(true);
  wallet.createUserWallet(token).then((value) => {
    // // ignore: avoid_print
    print('==== Print ===='),
    // ignore: avoid_print
    print(token)
  });

}