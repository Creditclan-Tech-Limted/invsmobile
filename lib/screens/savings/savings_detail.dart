import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/size_config.dart';

class SavingsDetailScreen extends StatefulWidget {
  static String routeName = "/savings_detail";
  @override
  _SavingsDetailState createState() => _SavingsDetailState();
}

class _SavingsDetailState extends State<SavingsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("General Savings"),
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
                            Text(
                              "Balance",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "N",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      color: Colors.white),
                                ),
                                Text(
                                  "85",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      color: Colors.white),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: getProportionateScreenHeight(5)),
                                  child: Text(
                                    ".7",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            Row(
                              children: [
                                Spacer(),
                                Text("My Target",
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
                                Text(
                                  "0% achieved",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      color: Colors.white),
                                ),
                                Spacer(),
                                Text(
                                  "N 0",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            LinearProgressIndicator(
                              backgroundColor: Colors.white,
                              value: 0,
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
                              Icons.home,
                              color: kPrimaryColor,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(8),
                            ),
                            Text(
                              "Withdraw",
                              style: TextStyle(color: kTextColorBlue),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.replay,
                              color: kPrimaryColor,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(8),
                            ),
                            Text(
                              "Rollover",
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
                              "My earnings",
                              style: TextStyle(color: kTextColorBlue),
                            )
                          ],
                        )
                      ],
                    ),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
