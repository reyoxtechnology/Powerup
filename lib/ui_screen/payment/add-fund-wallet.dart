import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../utils/app_url.dart';
import '../../utils/shared_preference.dart';
// ignore: import_of_legacy_library_into_null_safe
import '../../utils/constants.dart';
import '../baseui/baseui.dart';
import '../baseui/mainbaseui.dart';
import '../power/power_scrollbehaviour.dart';
import '../../models/wallet.dart';
import '../../providers/wallet_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../power/power_text.dart';
import '../power/power_textfield.dart';


// To get started quickly, change this to your heroku deployment of
// https://github.com/PaystackHQ/sample-charge-card-backend
// Step 1. Visit https://github.com/PaystackHQ/sample-charge-card-backend
// Step 2. Click "Deploy to heroku"
// Step 3. Login with your heroku credentials or create a free heroku account
// Step 4. Provide your secret key and an email with which to start all test transactions
// Step 5. Replace {YOUR_BACKEND_URL} below with the url generated by heroku (format https://some-url.herokuapp.com)
String backendUrl = AppUrl().baseApi;
// Set this to a public key that matches the secret key you supplied while creating the heroku instance
String paystackPublicKey = PAYSTACK_PUBLIC_KEY;
const String appName = APP_NAME;

class AddFundWallet extends StatefulWidget {   
    final double selectAmount;
    final double walletBalance;
    AddFundWallet({Key? key, required this.selectAmount, required this.walletBalance}) : super(key: key);

  @override
  _AddFundWalletState createState() => _AddFundWalletState();
}

class _AddFundWalletState extends State<AddFundWallet> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _verticalSizeBox = const SizedBox(height: 20.0);
  final _horizontalSizeBox = const SizedBox(width: 10.0);
  final plugin = PaystackPlugin();
  final _border =  Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.red,
  );
  int _radioValue = 0;
  CheckoutMethod _method = CheckoutMethod.card;
  bool _inProgress = false;
  String? _cardNumber;
  String? _cvv;
  int? _expiryMonth;
  int? _expiryYear;
  double? _fundAmount;
    @override
    void initState() {
      plugin.initialize(publicKey: paystackPublicKey);
    super.initState();
      print('==== navData ===');
      print(widget.selectAmount);
      print(widget.walletBalance);
      _fundAmount = widget.selectAmount;
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
            child: Form(
            key: _formKey,
            child: Container(
            padding: const EdgeInsets.all(30.0),
            margin: const EdgeInsets.only(top: 26.0),
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Proceed with payment.', 
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),

                      RichText(text:  TextSpan(
                        text: 'N ',
                        style:  const TextStyle(fontWeight: FontWeight.bold, color: Color(0xff000000), fontSize: 28.0),
                        children: <TextSpan>[
                          TextSpan(text: _fundAmount.toString()),
                        ],
                      ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 10.0, top:30.0),
                          child: const PowerText(
                            text: 'Select Card or Bank',
                            fontSize: 16.0,
                            color: Color(0xff979797),
                          )),
                       Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                        Flexible(
                        flex: 2,
                        child: DropdownButtonHideUnderline(
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              hintText: 'Checkout method',
                            ),
                            child: DropdownButton<
                                CheckoutMethod>(
                              value: _method,
                              isDense: true,
                              onChanged: (CheckoutMethod? value) {
                                if (value != null) {
                                  setState(() => _method = value);
                                }
                              },
                              items: banks.map((String value) {
                                return DropdownMenuItem<
                                    CheckoutMethod>(
                                  value:
                                      _parseStringToMethod(value),
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      ],
                       ),
                      const SizedBox(height: 38.0),
                      _getPlatformButton(
                        'Checkout',
                        () => _handleCheckout(context),
                      ),
                  ],),),
          ),
          ),
            
            ),
          ),
    );
  }

  _handleCheckout(BuildContext context) async {
    String stringAmount = _fundAmount.toString();
    var doubleAmount = double.parse('100') * double.parse(stringAmount);
    var newAmount = doubleAmount.round();
    print('== int ===');
    print(newAmount);

    setState(() => _inProgress = true);
    _formKey.currentState?.save();
    Charge charge = Charge()
      ..amount = newAmount //30000 // In base currency
      ..email = 'customer@email.com'
      ..putCustomField('Charged From', 'PowerUp Mobile');

      print('== _method ===');
      print(_getReference());

      if(_method.toString() == 'CheckoutMethod.card'){
        charge.reference = _getReference();
         print(_method);
         print(_method.toString());
      } else {
        charge.accessCode = _getReference();
         print(_method);
         print('_method 2');
      }

    try {
      CheckoutResponse response = await plugin.checkout(
        context,
        method: _method,
        charge: charge,
        fullscreen: false,
        logo: MyLogo(),
      );
      print('Response = $response');
      setState(() => _inProgress = false);
      _updateStatus(response.reference, '$response');
    } catch (e) {
      setState(() => _inProgress = false);
      _showMessage(e.toString());//"Check console for error"
      rethrow;
    }
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  PaymentCard _getCardFromUI() {
    // Using just the must-required parameters.
    print('== _cardNumber ===');
    print(_cardNumber);
    return PaymentCard(
      number: _cardNumber,
      cvc: _cvv,
      expiryMonth: _expiryMonth,
      expiryYear: _expiryYear,
    );
  }

  Widget _getPlatformButton(String string, Function() function) {
    // is still in progress
    Widget widget;
    if (Platform.isIOS) {
      widget = CupertinoButton(
        onPressed: function,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        color: CupertinoColors.activeBlue,
        child: Text(
          string,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    } else {
      widget = ElevatedButton(
        onPressed: function,
        child: Text(
          string.toUpperCase(),
          style: const TextStyle(fontSize: 17.0),
        ),
      );
    }
    return widget;
  }


  _updateStatus(String? reference, String message) {
    _showMessage('Reference: $reference \n\ Response: $message',
        const Duration(seconds: 7));
  }

  _showMessage(String message,
      [Duration duration = const Duration(seconds: 4)]) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: duration,
      action: SnackBarAction(
          label: 'CLOSE',
          onPressed: () =>
              ScaffoldMessenger.of(context).removeCurrentSnackBar()),
    ));
  }
}

var banks = ['Bank', 'Card'];

CheckoutMethod _parseStringToMethod(String string) {
  CheckoutMethod method = CheckoutMethod.card;
  switch (string) {
    case 'Bank':
      method = CheckoutMethod.bank;
      break;
    case 'Card':
      method = CheckoutMethod.card;
      break;
  }
  return method;
}

class MyLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: const Text(
        "CO",
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

const Color green = Color(0xFF3db76d);
const Color lightBlue = Color(0xFF34a5db);
const Color navyBlue = Color(0xFF031b33);