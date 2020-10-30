import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selcapital/size_config.dart';

class OnHoldPlansCard extends StatelessWidget {
  const OnHoldPlansCard({
    Key key,
    this.planType,
    this.balance,
    this.interestPerAnnum,
  }) : super(key: key);
  final String planType;
  final String balance;
  final String interestPerAnnum;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(getProportionateScreenHeight(10))),
      height: getProportionateScreenHeight(180),
      margin: EdgeInsets.fromLTRB(
          getProportionateScreenWidth(8),
          getProportionateScreenHeight(0),
          getProportionateScreenWidth(8),
          getProportionateScreenHeight(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: SvgPicture.asset("assets/icons/award_yellow.svg"),
            title: Text(
              planType,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                color: Color(0xFF12121F),
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              "On hold",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                color: Color(0xFFF8A33A),
                fontSize: 12,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(16),
                getProportionateScreenHeight(0),
                getProportionateScreenWidth(16),
                getProportionateScreenHeight(10)),
            padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(24),
                getProportionateScreenHeight(16),
                getProportionateScreenWidth(16),
                getProportionateScreenHeight(16)),
            decoration: BoxDecoration(
                color: Color(0xFFF1F2F1),
                borderRadius:
                    BorderRadius.circular(getProportionateScreenHeight(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      balance,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF41414F),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Balance",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFA7A6A6),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        interestPerAnnum,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF41414F),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "interest per annum",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFA7A6A6),
                          fontSize: 11,
                        ),
                      ),
                    ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
