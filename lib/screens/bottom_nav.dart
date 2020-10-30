import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/screens/dashboard/dashboard.dart';
import 'package:selcapital/screens/investment/investments.dart';
import 'package:selcapital/screens/savings/savings.dart';
import 'package:selcapital/screens/profile/account.dart';

class BottomNavigation extends StatefulWidget {
  static String routeName = "/bottom_navigation";
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => BottomNavigation());
  }

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final tabs = [
    Container(
      child: DashBoardScreen(),
    ),
    Container(
      child: SavingsScreen(),
    ),
    Container(
      child: InvestmentsScreen(),
    ),
    Container(
      child: AccountScreen(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: new IconThemeData(color: kSelectedColor),
        unselectedIconTheme: new IconThemeData(color: kSelectedColor),
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        selectedItemColor: kSelectedColor,
        unselectedItemColor: kTextColorGrey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/home.svg",
              color: kSelectedColor,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/search.svg"),
            activeIcon: SvgPicture.asset(
              "assets/icons/search.svg",
              color: kSelectedColor,
            ),
            label: "Plans",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/cart.svg"),
            activeIcon: SvgPicture.asset(
              "assets/icons/cart.svg",
              color: kSelectedColor,
            ),
            label: "Investments",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/user.svg"),
            activeIcon: SvgPicture.asset(
              "assets/icons/user.svg",
              color: kSelectedColor,
            ),
            label: "Account",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
