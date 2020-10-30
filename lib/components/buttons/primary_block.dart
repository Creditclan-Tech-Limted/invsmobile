import 'package:flutter/material.dart';
import 'package:selcapital/constants.dart';

class PrimaryBlockButton extends StatelessWidget {
  const PrimaryBlockButton({
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
        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: kPrimaryColor,
              blurRadius: 4.0,
              spreadRadius: 0.1,
            )
          ],
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
