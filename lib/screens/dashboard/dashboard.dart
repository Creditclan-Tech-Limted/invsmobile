import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/screens/onboarding/login.dart';
import 'package:selcapital/screens/plans/vest_later/vest_later.dart';
import 'package:selcapital/screens/plans/vest_small/vest_small.dart';
import 'package:selcapital/size_config.dart';
import 'package:selcapital/providers/user.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardBodyState createState() => _DashBoardBodyState();
}

class _DashBoardBodyState extends State<DashBoardScreen> {
  int s = 0;
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
      builder: (context, user, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Dashboard",
            ),
            automaticallyImplyLeading: false,
            actions: [
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    if (isSwitched) {
                      s = 1;
                    } else {
                      s = 0;
                    }
                  });
                },
                activeTrackColor: kTextColorGrey,
                activeColor: kPrimaryColor,
                materialTapTargetSize: MaterialTapTargetSize.padded,
              ),
              IconButton(
                  icon: SvgPicture.asset("assets/icons/logout.svg"),
                  onPressed: () async {
                    await user.logout();
                    Navigator.popAndPushNamed(context, LoginScreen.routeName);
                  })
            ],
          ),
          body: Container(
            color: kBackgroundColor,
            padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(16),
                getProportionateScreenHeight(20),
                getProportionateScreenWidth(16),
                getProportionateScreenHeight(28)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(
                            getProportionateScreenHeight(10))),
                    padding: EdgeInsets.fromLTRB(
                        getProportionateScreenWidth(30),
                        getProportionateScreenHeight(46),
                        getProportionateScreenWidth(16),
                        getProportionateScreenHeight(32)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(
                              0, getProportionateScreenHeight(15), 20, 0),
                          child: SvgPicture.asset("assets/icons/bag.svg"),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.fromLTRB(
                                  0, 0, 0, getProportionateScreenHeight(0)),
                              child: Text("Balance",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13)),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.fromLTRB(
                                  getProportionateScreenWidth(0),
                                  0,
                                  0,
                                  getProportionateScreenHeight(0)),
                              child: Text("0.00",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        getProportionateScreenWidth(0),
                        getProportionateScreenHeight(8),
                        0,
                        getProportionateScreenHeight(4)),
                    alignment: Alignment.centerLeft,
                    child: Text("My Plans",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: kTextColorBlue,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ),
                  Container(
                    child: IndexedStack(
                      index: s,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0xFFE0CCCE),
                              border: Border.all(color: kColorBrickRedLight),
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenHeight(10))),
                          padding: EdgeInsets.fromLTRB(
                              getProportionateScreenWidth(18),
                              getProportionateScreenHeight(20),
                              getProportionateScreenWidth(0),
                              getProportionateScreenHeight(20)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: getProportionateScreenWidth(40),
                                margin: EdgeInsets.fromLTRB(
                                    0, getProportionateScreenHeight(16), 20, 0),
                                child: SvgPicture.asset(
                                    "assets/icons/no_plans.svg"),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        getProportionateScreenWidth(0),
                                        getProportionateScreenHeight(0),
                                        getProportionateScreenWidth(0),
                                        0),
                                    alignment: Alignment.topLeft,
                                    child: Text("No active investment plan",
                                        style: TextStyle(
                                            color: kColorBrickRed,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w500,
                                            fontSize:
                                                getProportionateScreenWidth(
                                                    14))),
                                  ),
                                  Container(
                                    width: getProportionateScreenWidth(200),
                                    margin: EdgeInsets.fromLTRB(
                                        getProportionateScreenWidth(0),
                                        getProportionateScreenHeight(0),
                                        getProportionateScreenWidth(40),
                                        0),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        "Select an option below to get started ",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color(0xFF647177),
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w500,
                                            fontSize:
                                                getProportionateScreenWidth(
                                                    13))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                getProportionateScreenWidth(0),
                                getProportionateScreenHeight(4),
                                getProportionateScreenWidth(10),
                                getProportionateScreenHeight(4)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          getProportionateScreenHeight(10))),
                                  padding: EdgeInsets.fromLTRB(
                                      getProportionateScreenWidth(24),
                                      getProportionateScreenHeight(10),
                                      getProportionateScreenWidth(24),
                                      getProportionateScreenHeight(10)),
                                  margin: EdgeInsets.only(
                                      right: getProportionateScreenWidth(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.fromLTRB(
                                            0,
                                            getProportionateScreenHeight(0),
                                            20,
                                            0),
                                        child: SvgPicture.asset(
                                          "assets/icons/award.svg",
                                          color: Color(0xFFF8A33A),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            margin: EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                0,
                                                getProportionateScreenHeight(
                                                    0)),
                                            child: Text("Plan 1",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Color(0xFFF8A33A),
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14)),
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            margin: EdgeInsets.fromLTRB(
                                                getProportionateScreenWidth(0),
                                                0,
                                                0,
                                                getProportionateScreenHeight(
                                                    0)),
                                            child: Text("N240,000",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Color(0xFF647177),
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          getProportionateScreenHeight(10))),
                                  padding: EdgeInsets.fromLTRB(
                                      getProportionateScreenWidth(24),
                                      getProportionateScreenHeight(10),
                                      getProportionateScreenWidth(24),
                                      getProportionateScreenHeight(10)),
                                  margin: EdgeInsets.only(
                                      right: getProportionateScreenWidth(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.fromLTRB(
                                            0,
                                            getProportionateScreenHeight(0),
                                            20,
                                            0),
                                        child: SvgPicture.asset(
                                          "assets/icons/award.svg",
                                          color: Color(0xFFF8A33A),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            margin: EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                0,
                                                getProportionateScreenHeight(
                                                    0)),
                                            child: Text("Plan 2",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Color(0xFFF8A33A),
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14)),
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            margin: EdgeInsets.fromLTRB(
                                                getProportionateScreenWidth(0),
                                                0,
                                                0,
                                                getProportionateScreenHeight(
                                                    0)),
                                            child: Text("N270,000",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Color(0xFF647177),
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          getProportionateScreenHeight(10))),
                                  padding: EdgeInsets.fromLTRB(
                                      getProportionateScreenWidth(24),
                                      getProportionateScreenHeight(10),
                                      getProportionateScreenWidth(24),
                                      getProportionateScreenHeight(10)),
                                  margin: EdgeInsets.only(
                                      right: getProportionateScreenWidth(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.fromLTRB(
                                            0,
                                            getProportionateScreenHeight(0),
                                            20,
                                            0),
                                        child: SvgPicture.asset(
                                          "assets/icons/award.svg",
                                          color: Color(0xFFF8A33A),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            margin: EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                0,
                                                getProportionateScreenHeight(
                                                    0)),
                                            child: Text("Plan 3",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Color(0xFFF8A33A),
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14)),
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            margin: EdgeInsets.fromLTRB(
                                                getProportionateScreenWidth(0),
                                                0,
                                                0,
                                                getProportionateScreenHeight(
                                                    0)),
                                            child: Text("N170,000",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Color(0xFF647177),
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, VestLaterScreen.routeName);
                    },
                    child: Container(
                      width: double.infinity,
                      height: getProportionateScreenHeight(190),
                      margin: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(0),
                          getProportionateScreenHeight(20),
                          getProportionateScreenWidth(0),
                          getProportionateScreenHeight(20)),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(10))),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              "assets/images/plan-1.png",
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ),
                          Opacity(
                            opacity: 0.7,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF000000),
                                  borderRadius: BorderRadius.circular(
                                      getProportionateScreenHeight(10))),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                getProportionateScreenWidth(30),
                                getProportionateScreenHeight(40),
                                getProportionateScreenWidth(30),
                                getProportionateScreenHeight(40)),
                            child: Column(
                              textDirection: TextDirection.ltr,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text("Vest Later",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              getProportionateScreenWidth(24))),
                                ),
                                Container(
                                  child: Text(
                                      "Invest in smart market for a higher yield on portfolio",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500,
                                          fontSize:
                                              getProportionateScreenWidth(12))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, VestSmallScreen.routeName);
                    },
                    child: Container(
                      width: double.infinity,
                      height: getProportionateScreenHeight(190),
                      margin: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(0),
                          getProportionateScreenHeight(0),
                          getProportionateScreenWidth(0),
                          getProportionateScreenHeight(20)),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(10))),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                getProportionateScreenHeight(10)),
                            child: Container(
                              child: Image.asset(
                                "assets/images/plan-2.png",
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                                height: double.infinity,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: 0.7,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF000000),
                                  borderRadius: BorderRadius.circular(
                                      getProportionateScreenHeight(10))),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                getProportionateScreenWidth(30),
                                getProportionateScreenHeight(40),
                                getProportionateScreenWidth(30),
                                getProportionateScreenHeight(40)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              textDirection: TextDirection.ltr,
                              children: [
                                Container(
                                  child: Text("Vest Small Small ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              getProportionateScreenWidth(24))),
                                ),
                                Container(
                                  child: Text(
                                      "Consists of smaller saving plans to achieve a target goal",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500,
                                          fontSize:
                                              getProportionateScreenWidth(12))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: kColorBrickRedLight),
                        borderRadius: BorderRadius.circular(
                            getProportionateScreenHeight(10))),
                    padding: EdgeInsets.fromLTRB(
                        getProportionateScreenWidth(18),
                        getProportionateScreenHeight(20),
                        getProportionateScreenWidth(0),
                        getProportionateScreenHeight(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: getProportionateScreenWidth(40),
                          margin: EdgeInsets.fromLTRB(
                              0, getProportionateScreenHeight(4), 20, 0),
                          child: SvgPicture.asset("assets/icons/clock_alt.svg"),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(
                                  getProportionateScreenWidth(3),
                                  getProportionateScreenHeight(0),
                                  getProportionateScreenWidth(60),
                                  0),
                              alignment: Alignment.topLeft,
                              child: Text("See your recent activities",
                                  style: TextStyle(
                                      color: kTextColorBlue,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          getProportionateScreenWidth(14))),
                            ),
                            Container(
                              width: getProportionateScreenWidth(200),
                              margin: EdgeInsets.fromLTRB(
                                  getProportionateScreenWidth(0),
                                  getProportionateScreenHeight(0),
                                  getProportionateScreenWidth(38),
                                  0),
                              alignment: Alignment.topLeft,
                              child: Text("Last updated 2 minutes ago",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: kTextColorBlue,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.normal,
                                      fontSize:
                                          getProportionateScreenWidth(12))),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
