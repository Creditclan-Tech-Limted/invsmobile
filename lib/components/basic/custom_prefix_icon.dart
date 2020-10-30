import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPrefixIcon extends StatelessWidget {
  const CustomPrefixIcon({
    Key key,
    @required this.svgIcon,
  }) : super(key: key);
  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
      child: SvgPicture.asset(
        svgIcon,
        height: 25,
      ),
    );
  }
}
