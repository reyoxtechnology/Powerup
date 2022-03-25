import 'package:flutter/material.dart';

import 'package:powerup/ui_screen/baseui/mainbaseui.dart';
import 'package:powerup/ui_screen/power/power_cantap.dart';
import 'package:powerup/ui_screen/power/power_grid.dart';
import 'package:powerup/ui_screen/power/power_scrollbehaviour.dart';

const String phcnPath = 'power_imgs/paybills_imgs';

List<Map<String, String>> payBillsData = [
  {'name': 'Abuja Electricity', 'photoUrl': '$phcnPath/aedc_electric.jpeg'},
  {'name': 'Eko PHCN', 'photoUrl': '$phcnPath/ekoelectric.jpeg'},
  {'name': 'Enugu PHCN', 'photoUrl': '$phcnPath/enugu_electric.jpeg'},
  {'name': 'Ibadan Electricity', 'photoUrl': '$phcnPath/ibedc_electric.jpeg'},
  {'name': 'Ikeja Electricity', 'photoUrl': '$phcnPath/ikeja_electric.jpeg'},
  {'name': 'Port Electricity', 'photoUrl': '$phcnPath/port_electric.jpeg'},
  {'name': 'Smile Bundles', 'photoUrl': '$phcnPath/smile_bundles.jpeg'},
  {'name': 'Smile Recharge', 'photoUrl': '$phcnPath/smile_recharge.jpeg'},
  {'name': 'Spectranet', 'photoUrl': '$phcnPath/spectranet.jpeg'},
];

class PayBills extends StatelessWidget {
  const PayBills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainBaseUi(
        title: 'Pay Bills',
        child: ScrollConfiguration(
          behavior: PowerScrollBehavior(),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: payBillsData.length,
              itemBuilder: (context, index) {
                dynamic obj = payBillsData[index];
                String title =obj['name'];
                String url =  obj['photoUrl'];
                return PowerCantap(
                    child: PowerGrid(
                        footer: title,
                        imageUrl:url,
                        doCoverImg: false,
                        ),
                    onTap: () {
                      
                    });
              }),
        ),
        showBackButton: true);
  }
}
