import 'package:flutter/material.dart';
import 'package:selcapital/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.fromLTRB(42, 40, 42, 15),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: kTextColorWhite,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
