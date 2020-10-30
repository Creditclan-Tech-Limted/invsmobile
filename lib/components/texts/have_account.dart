import 'package:flutter/material.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/screens/onboarding/login.dart';

class HaveAccountText extends StatelessWidget {
  const HaveAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Have an Account?",
          style: TextStyle(
            color: kTextColorGrey,
            fontFamily: "Poppins",
            fontSize: 12,
          ),
        ),
        GestureDetector(
          onTap: () =>
              Navigator.popAndPushNamed(context, LoginScreen.routeName),
          child: Container(
            margin: EdgeInsets.only(left: 2),
            child: Text(
              "Sign In",
              style: TextStyle(
                color: kPrimaryColor,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
