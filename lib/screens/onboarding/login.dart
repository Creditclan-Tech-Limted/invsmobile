import 'package:flutter/material.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/components/texts/forgot_password.dart';
import 'package:selcapital/components/texts/no_account.dart';
import 'package:selcapital/components/forms/login.dart';
import 'package:selcapital/size_config.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(18), 0,
            getProportionateScreenWidth(18), 0),
        child: LoginBody(),
      ),
    );
  }
}

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  String header;
  int _pageState = 0;
  @override
  Widget build(BuildContext context) {
    switch (_pageState) {
    }
    return Container(
      // duration: Duration(milliseconds: 1000),
      margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(5), 0, 0, 0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(3),
                getProportionateScreenHeight(48),
                0,
                getProportionateScreenHeight(16)),
            alignment: Alignment.centerLeft,
            child: Text(
              "Login",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 31,
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
              "Secure login to your account",
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
                getProportionateScreenHeight(26),
                getProportionateScreenWidth(3),
                getProportionateScreenHeight(15)),
            child: LoginForm(),
          ),
          Container(
            child: Center(
              child: Text(
                "OR",
                style: TextStyle(
                  color: kTextColorDark,
                  fontSize: 14,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     border: Border.all(color: kStrokeColorDark),
          //     borderRadius: BorderRadius.circular(5),
          //   ),
          //   margin:
          //       EdgeInsets.fromLTRB(0, getProportionateScreenHeight(10), 0, 0),
          //   height: getProportionateScreenHeight(59),
          //   alignment: Alignment.centerLeft,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       SocialButton(
          //         icon: "assets/icons/google.svg",
          //       ),
          //       SizedBox(width: getProportionateScreenWidth(30)),
          //       Center(
          //         child: Text(
          //           "Login with Google",
          //           style: TextStyle(
          //             color: kTextColorGrey,
          //             fontSize: 14,
          //             fontFamily: "Poppins",
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   decoration: BoxDecoration(
          //     border: Border.all(color: kStrokeColorDark),
          //     borderRadius: BorderRadius.circular(5),
          //   ),
          //   margin:
          //       EdgeInsets.fromLTRB(0, getProportionateScreenHeight(10), 0, 0),
          //   height: getProportionateScreenHeight(59),
          //   alignment: Alignment.centerLeft,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       SocialButton(
          //         icon: "assets/icons/facebook.svg",
          //       ),
          //       SizedBox(
          //         width: getProportionateScreenWidth(30),
          //       ),
          //       Center(
          //         child: Text(
          //           "Login with Facebook",
          //           style: TextStyle(
          //             color: kTextColorGrey,
          //             fontSize: 14,
          //             fontFamily: "Poppins",
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            margin: EdgeInsets.only(top: getProportionateScreenHeight(25)),
            child: Center(child: ForgotPasswordText()),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, getProportionateScreenHeight(20), 0,
                getProportionateScreenHeight(50)),
            child: Center(child: NoAccountText()),
          ),
        ],
      ),
    );
  }
}
