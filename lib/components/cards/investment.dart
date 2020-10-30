import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selcapital/size_config.dart';

class InvestmentCard extends StatelessWidget {
  const InvestmentCard({
    Key key,
    this.avatar,
    this.investmentType,
    this.percentageDone,
    this.minAmount,
    this.monthDue,
    this.minGuaranteePercentage,
  }) : super(key: key);
  final String avatar;
  final String investmentType;
  final String percentageDone;
  final String minAmount;
  final String monthDue;
  final String minGuaranteePercentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(getProportionateScreenHeight(10))),
      margin: EdgeInsets.fromLTRB(
          getProportionateScreenWidth(12),
          getProportionateScreenHeight(8),
          getProportionateScreenWidth(8),
          getProportionateScreenHeight(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(16),
                getProportionateScreenHeight(16),
                getProportionateScreenWidth(0),
                getProportionateScreenHeight(16)),
            child: Row(
              children: [
                Container(child: SvgPicture.asset(avatar)),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(16),
                      getProportionateScreenHeight(0),
                      getProportionateScreenWidth(16),
                      getProportionateScreenHeight(0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(investmentType,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF12121F),
                            fontSize: 15,
                          )),
                      SizedBox(
                        height: getProportionateScreenHeight(4),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/clock.svg"),
                          SizedBox(
                            width: getProportionateScreenWidth(3),
                          ),
                          Text(
                            percentageDone,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFF8A33A),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(0),
                getProportionateScreenHeight(0),
                getProportionateScreenWidth(0),
                getProportionateScreenHeight(0)),
            padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(24),
                getProportionateScreenHeight(15),
                getProportionateScreenWidth(24),
                getProportionateScreenHeight(18)),
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
                      minAmount,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF41414F),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Min Amount",
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      monthDue,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF41414F),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Min duration",
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        minGuaranteePercentage,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF41414F),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Min guarantee",
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
