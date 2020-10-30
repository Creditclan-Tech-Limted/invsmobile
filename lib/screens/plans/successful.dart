import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selcapital/components/buttons/primary_block.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/screens/bottom_nav.dart';
import 'package:selcapital/size_config.dart';

class SuccesfulScreen extends StatefulWidget {
  static String routeName = "/succesful";
  @override
  _SuccesfulState createState() => _SuccesfulState();
}

class _SuccesfulState extends State<SuccesfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(200),
            horizontal: getProportionateScreenWidth(32)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/icons/success.svg"),
              Container(
                  child: Text("Success",
                      style: TextStyle(
                          color: kTextColorBlue,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 24))),
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(70)),
                  child: Text(
                    "You are now investing in this plan",
                    style: TextStyle(
                        color: kTextColorBlue,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                    textAlign: TextAlign.center,
                  )),
              PrimaryBlockButton(
                text: "Go back to Dashboard",
                press: () {
                  Navigator.pushNamed(context, BottomNavigation.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
