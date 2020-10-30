import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/size_config.dart';

class InvestmentDetailScreen extends StatefulWidget {
  static String routeName = "/investment_detail";
  @override
  _InvestmentDetailScreenState createState() =>
      _InvestmentDetailScreenState();
}

class _InvestmentDetailScreenState extends State<InvestmentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transportation"),
        titleSpacing: 20,
        automaticallyImplyLeading: true,
      ),
      body: Container(
        color: Color(0xFFF2F2F2),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(24),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(16)),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      border: Border.all(color: kStrokeColorDark),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(24),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Current Value",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      color: Colors.white),
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFCCE0FF),
                                      border: Border.all(color: kPrimaryColor),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text("PENDING",
                                      style: TextStyle(
                                          color: kPrimaryColor, fontSize: 14)),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "$naira",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      color: Colors.white),
                                ),
                                Text(
                                  "100",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: getProportionateScreenHeight(6),
                                  bottom: getProportionateScreenHeight(16)),
                              width: double.infinity,
                              child: SvgPicture.asset(
                                "assets/icons/stroke.svg",
                                color: Colors.white,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Row(
                              children: [
                                Text("Daily Price Change",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    )),
                                Spacer(),
                                Text("Units",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.red,
                                ),
                                Text(
                                  "0.00",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      color: Colors.red),
                                ),
                                Spacer(),
                                Text(
                                  "0.00",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(getProportionateScreenWidth(24.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.pie_chart,
                              color: kPrimaryColor,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(8),
                            ),
                            Text(
                              "Invest More",
                              style: TextStyle(color: kTextColorBlue),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.local_pizza,
                              color: kPrimaryColor,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(8),
                            ),
                            Text(
                              "Sell Units",
                              style: TextStyle(color: kTextColorBlue),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.equalizer,
                              color: kPrimaryColor,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(8),
                            ),
                            Text(
                              "Price History",
                              style: TextStyle(color: kTextColorBlue),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [Text("You Invested in"), Spacer()],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("TRANSPORTATION",
                          style:
                              TextStyle(color: kTextColorBlue, fontSize: 20)),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: kPrimaryColor,
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: getProportionateScreenHeight(16),
                        bottom: getProportionateScreenHeight(24)),
                    width: double.infinity,
                    child: SvgPicture.asset(
                      "assets/icons/stroke.svg",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Current Buy Price",
                              style: TextStyle(
                                  color: kTextColorGrey, fontSize: 14)),
                          Text("$naira 1.28",
                              style: TextStyle(
                                  color: kTextColorBlue, fontSize: 20)),
                        ],
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(40),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Current Sell Price",
                              style: TextStyle(
                                  color: kTextColorGrey, fontSize: 14)),
                          Text("$naira 1.26",
                              style: TextStyle(
                                  color: kTextColorBlue, fontSize: 20)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Card(
                  margin: EdgeInsets.all(16),
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Keep it up, Buhari!",
                                style: TextStyle(
                                    color: kTextColorBlue, fontSize: 20)),
                            Spacer(),
                            Icon(
                              Icons.check_circle,
                              color: kPrimaryColor,
                            )
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(5.0),
                        ),
                        Text(
                            "Don't stop now, You're on the right \ntrack. Set a new maturity date to \ncontinue the saving challenge",
                            style:
                                TextStyle(color: kTextColorGrey, fontSize: 16)),
                      ],
                    ),
                  ),
                )),
            Container(
              padding: EdgeInsets.all(24),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("SAVING PREFERENCE",
                              style: TextStyle(
                                  color: kTextColorGrey, fontSize: 16)),
                          SizedBox(
                            height: getProportionateScreenHeight(5.0),
                          ),
                          Text("N 50,000/month",
                              style:
                                  TextStyle(color: kPrimaryColor, fontSize: 16))
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(16, 5, 16, 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(4)),
                        child: Text("EDIT",
                            style:
                                TextStyle(color: kPrimaryColor, fontSize: 16)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(8.0),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: getProportionateScreenHeight(16)),
                    width: double.infinity,
                    child: SvgPicture.asset(
                      "assets/icons/stroke.svg",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("NEXT SAVING DATE",
                              style: TextStyle(
                                  color: kTextColorGrey, fontSize: 12)),
                          SizedBox(
                            height: getProportionateScreenHeight(5.0),
                          ),
                          Text("Dec 09, 2020",
                              style: TextStyle(
                                  color: kTextColorBlue, fontSize: 16))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("START DATE",
                              style: TextStyle(
                                  color: kTextColorGrey, fontSize: 12)),
                          SizedBox(
                            height: getProportionateScreenHeight(5.0),
                          ),
                          Text("Mar 09, 2020",
                              style: TextStyle(
                                  color: kTextColorBlue, fontSize: 16))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(16.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("PLAN TYPE",
                              style: TextStyle(
                                  color: kTextColorGrey, fontSize: 12)),
                          SizedBox(
                            height: getProportionateScreenHeight(5.0),
                          ),
                          Text("Save As You Earn",
                              style: TextStyle(
                                  color: kTextColorBlue, fontSize: 16))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("MATURITY DATE",
                              style: TextStyle(
                                  color: kTextColorGrey, fontSize: 12)),
                          SizedBox(
                            height: getProportionateScreenHeight(5.0),
                          ),
                          Text("Matured",
                              style: TextStyle(
                                  color: kTextColorBlue, fontSize: 16))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(16.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("AUTONOMOUS STATUS",
                              style: TextStyle(
                                  color: kTextColorGrey, fontSize: 12)),
                          SizedBox(
                            height: getProportionateScreenHeight(5.0),
                          ),
                          Text("On Hold",
                              style: TextStyle(
                                  color: kTextColorBlue, fontSize: 16))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("INTEREST P/A",
                              style: TextStyle(
                                  color: kTextColorGrey, fontSize: 12)),
                          SizedBox(
                            height: getProportionateScreenHeight(5.0),
                          ),
                          Text("0.0%",
                              style: TextStyle(
                                  color: kTextColorBlue, fontSize: 16))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(16.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("DEBIT CARD",
                              style: TextStyle(
                                  color: kTextColorGrey, fontSize: 12)),
                          SizedBox(
                            height: getProportionateScreenHeight(5.0),
                          ),
                          Text("None set",
                              style: TextStyle(
                                  color: kTextColorBlue, fontSize: 16))
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
