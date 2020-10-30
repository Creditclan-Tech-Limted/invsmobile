import 'package:flutter/material.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/screens/onboarding/bvn.dart';
import 'package:selcapital/size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Don't have an Account?",
          style: TextStyle(
            color: kTextColorGrey,
            fontFamily: "Poppins",
            fontSize: 12,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => BvnValidation())),
          child: Container(
            margin: EdgeInsets.only(left: getProportionateScreenWidth(3)),
            child: Text(
              "Register",
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
