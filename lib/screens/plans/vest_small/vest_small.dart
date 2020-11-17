import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selcapital/screens/plans/vest_small/goal_title.dart';
import 'package:selcapital/size_config.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/providers/savings.dart';

class VestSmallScreen extends StatelessWidget {
  static String routeName = "/vest_small";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: getProportionateScreenHeight(5),
        title: Text(
          "Vest Small Small",
        ),
        automaticallyImplyLeading: true,
      ),
      body: Container(
          color: Colors.white,
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin:
                    EdgeInsets.only(bottom: getProportionateScreenHeight(8)),
                height: getProportionateScreenHeight(150),
                child: Image.asset(
                  "assets/images/plan-detail-2.png",
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(16),
                    getProportionateScreenHeight(24),
                    getProportionateScreenWidth(16),
                    getProportionateScreenHeight(24)),
                child: Text(
                    "Choose one from the list of vest small small plans below",
                    style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    )),
              ),
              VestSmallScreenBody(),
              SizedBox(
                height: getProportionateScreenHeight(20),
              )
            ],
          )),
    );
  }
}

class VestSmallScreenBody extends StatefulWidget {
  @override
  _VestSmallScreenBodyState createState() => _VestSmallScreenBodyState();
}

class _VestSmallScreenBodyState extends State<VestSmallScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SavingsModel>(
      builder: (context, savings, child) {
        return Container(
          padding: EdgeInsets.fromLTRB(
              getProportionateScreenWidth(16),
              getProportionateScreenHeight(16),
              getProportionateScreenWidth(16),
              getProportionateScreenHeight(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      savings.addPlan('1');
                      Navigator.pushNamed(context, GoalTitleScreen.routeName);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/bag_with_bg.svg"),
                        Text(
                          "Business",
                          style: TextStyle(
                            letterSpacing: 1,
                            color: Color(0xFF41414F),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      savings.addPlan('2');
                      Navigator.pushNamed(context, GoalTitleScreen.routeName);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/shirt.svg"),
                        Text(
                          "Work",
                          style: TextStyle(
                            letterSpacing: 1,
                            color: Color(0xFF41414F),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      savings.addPlan('3');
                      Navigator.pushNamed(context, GoalTitleScreen.routeName);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/t_shirt.svg"),
                        Text(
                          "School",
                          style: TextStyle(
                            letterSpacing: 1,
                            color: Color(0xFF41414F),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: getProportionateScreenHeight(16)),
                child: GestureDetector(
                  onTap: () {
                    savings.addPlan('4');
                    Navigator.pushNamed(context, GoalTitleScreen.routeName);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/trouser.svg"),
                      Text(
                        "Fashion",
                        style: TextStyle(
                          letterSpacing: 1,
                          color: Color(0xFF41414F),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
