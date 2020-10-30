import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key key,
    this.icon,
    this.press,
  }) : super(key: key);
  final String icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: (5)),
        padding: EdgeInsets.all((10)),
        height: 40,
        width: 40,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
