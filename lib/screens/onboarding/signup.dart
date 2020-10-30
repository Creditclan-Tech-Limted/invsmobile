import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/components/texts/have_account.dart';
import 'package:selcapital/screens/onboarding/login.dart';
import 'package:selcapital/components/forms/signup.dart';
import 'package:selcapital/size_config.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(18), 0,
            getProportionateScreenWidth(18), 0),
        child: ListView(
          shrinkWrap: true,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, LoginScreen.routeName),
              child: Container(
                margin: EdgeInsets.fromLTRB(0, getProportionateScreenHeight(26),
                    0, getProportionateScreenHeight(36)),
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  "assets/icons/arrow_left_circle.svg",
                ),
              ),
            ),
            SignUpBody(),
          ],
        ),
      ),
    );
  }
}

class SignUpBody extends StatefulWidget {
  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin:
                EdgeInsets.fromLTRB(getProportionateScreenWidth(5), 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Register",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 28,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(3),
                getProportionateScreenHeight(10), 0, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Create your account today",
              style: TextStyle(
                color: kTextColorDark,
                fontSize: 17,
                fontFamily: "Poppins",
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(3),
                getProportionateScreenHeight(36),
                getProportionateScreenWidth(3),
                getProportionateScreenHeight(0)),
            child: SignUpForm(),
          ),
          Container(
            margin: EdgeInsets.only(top: getProportionateScreenHeight(10)),
            child: Center(
              child: HaveAccountText(),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
        ],
      ),
    );
  }
}
