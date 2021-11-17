import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PowerBottomNavBar extends StatelessWidget {
  final Color? bgColor;
  final int currentIndex;
  final ValueChanged<int> onTapItem;

  const PowerBottomNavBar(
      {Key? key, this.bgColor, this.currentIndex = 0, required this.onTapItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
           color: const Color(0xffF3F6FA),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.sp),
                topRight: Radius.circular(20.sp))),
        child: BottomNavigationBar(
            currentIndex: currentIndex,
            backgroundColor: bgColor ?? const Color(0xffF3F6FA),
            selectedItemColor:const Color(0xffE19F21),
            showUnselectedLabels: true,
            unselectedItemColor:const Color(0xff979797),
            type: BottomNavigationBarType.fixed,
            onTap: (int itemIndex) {
              onTapItem(itemIndex);
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home_filled),

              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                   label: 'History'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.wifi),
                   label: 'Buy Units'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet), 
                  label: 'Payments'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                   label: 'Settings'
                   ),
            ]));
  }
}
