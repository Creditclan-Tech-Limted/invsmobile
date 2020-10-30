import 'package:flutter/material.dart';
import 'package:selcapital/components/cards/investment.dart';
import 'package:selcapital/screens/plans/add_plan.dart';
import 'package:selcapital/screens/investment/investment_detail.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/size_config.dart';

class InvestmentsScreen extends StatelessWidget {
  static String routeName = "/investments";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Investments",
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
                  "assets/images/plan-detail-2.png",
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              MyInvestmentScreenBody(),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF4EE3E5),
        onPressed: () => Navigator.pushNamed(context, AddPlanScreen.routeName),
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyInvestmentScreenBody extends StatefulWidget {
  @override
  _MyInvestmentScreenBodyState createState() => _MyInvestmentScreenBodyState();
}

class _MyInvestmentScreenBodyState extends State<MyInvestmentScreenBody> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, InvestmentDetailScreen.routeName),
      child: InvestmentCard(
        avatar: "assets/icons/truck_green.svg",
        investmentType: "Transportation",
        percentageDone: "12%",
        minAmount: "N40,000",
        monthDue: "6 months",
        minGuaranteePercentage: "11%",
      ),
    );
  }
}
