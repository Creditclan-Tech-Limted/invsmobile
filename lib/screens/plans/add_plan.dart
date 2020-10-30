import 'package:flutter/material.dart';
import 'package:selcapital/screens/plans/vest_later/vest_later.dart';
import 'package:selcapital/screens/plans/vest_small/vest_small.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/size_config.dart';

class AddPlanScreen extends StatelessWidget {
  static String routeName = "/add_plan";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Plan",
        ),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(16),
            getProportionateScreenHeight(0),
            getProportionateScreenWidth(16),
            getProportionateScreenHeight(0)),
        color: kBackgroundColor,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, VestLaterScreen.routeName);
              },
              child: Container(
                width: double.infinity,
                height: getProportionateScreenHeight(250),
                margin: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(0),
                    getProportionateScreenHeight(60),
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
                          getProportionateScreenHeight(70),
                          getProportionateScreenWidth(30),
                          getProportionateScreenHeight(70)),
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
                                    fontSize: getProportionateScreenWidth(24))),
                          ),
                          Container(
                            child: Text(
                                "Invest in smart market for a higher yield on portfolio",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: getProportionateScreenWidth(12))),
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
                height: getProportionateScreenHeight(250),
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
                          getProportionateScreenHeight(70),
                          getProportionateScreenWidth(30),
                          getProportionateScreenHeight(70)),
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
                                    fontSize: getProportionateScreenWidth(24))),
                          ),
                          Container(
                            child: Text(
                                "Consists of smaller saving plans to achieve a target goal",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: getProportionateScreenWidth(12))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
