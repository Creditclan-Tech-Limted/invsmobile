import 'package:flutter/material.dart';
import 'package:selcapital/components/cards/active_plans.dart';
import 'package:selcapital/components/cards/on_hold_plans.dart';
import 'package:selcapital/screens/plans/add_plan.dart';
import 'package:selcapital/screens/savings/savings_detail.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/size_config.dart';

class SavingsScreen extends StatelessWidget {
  static String routeName = "/savings";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Plans",
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: kBackgroundColor,
        child: Column(
          children: [
            Container(
              height: getProportionateScreenHeight(150),
              child: Image.asset(
                "assets/images/plan-detail-1.png",
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            MyPlansBody(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF4EE3E5),
        onPressed: () => Navigator.pushNamed(context, AddPlanScreen.routeName),
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyPlansBody extends StatefulWidget {
  @override
  _MyPlansBodyState createState() => _MyPlansBodyState();
}

class _MyPlansBodyState extends State<MyPlansBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context, SavingsDetailScreen.routeName),
        child: ActivePlansCard(
          planType: "School Fees",
          interestPerAnnum: "10%",
          balance: "N20,000",
        ),
      ),
      GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, SavingsDetailScreen.routeName),
          child: OnHoldPlansCard(
            planType: "Wedding",
            interestPerAnnum: "14%",
            balance: "N74,000",
          )),
    ]);
  }
}
