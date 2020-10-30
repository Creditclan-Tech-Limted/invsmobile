import 'package:flutter/material.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/screens/onboarding/forgot_password.dart';

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, ForgotPassword.routeName),
      child: Text(
        "Forgot your password?",
        style: TextStyle(
          color: kPrimaryColor,
          fontFamily: "Poppins",
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
