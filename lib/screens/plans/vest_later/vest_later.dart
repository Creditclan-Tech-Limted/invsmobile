import 'package:flutter/material.dart';
import 'package:selcapital/components/cards/investment.dart';
import 'package:selcapital/screens/plans/vest_later/product_detail.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/size_config.dart';

class VestLaterScreen extends StatelessWidget {
  static String routeName = "/vest_later";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vest Later",
        ),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            color: kBackgroundColor,
            child: Column(
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
                VestLaterScreenBody(),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                )
              ],
            )),
      ),
    );
  }
}

class VestLaterScreenBody extends StatefulWidget {
  @override
  _VestLaterScreenBodyState createState() => _VestLaterScreenBodyState();
}

class _VestLaterScreenBodyState extends State<VestLaterScreenBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, ProductDetailScreen.routeName),
          child: Column(
            children: [
              InvestmentCard(
                avatar: "assets/icons/truck_green.svg",
                investmentType: "Transportation",
                percentageDone: "12%",
                minAmount: "N40,000",
                monthDue: "6 months",
                minGuaranteePercentage: "11%",
              ),
              InvestmentCard(
                avatar: "assets/icons/cloud.svg",
                investmentType: "Transportation",
                percentageDone: "12%",
                minAmount: "N40,000",
                monthDue: "6 months",
                minGuaranteePercentage: "11%",
              ),
              InvestmentCard(
                avatar: "assets/icons/truck_green.svg",
                investmentType: "Transportation",
                percentageDone: "12%",
                minAmount: "N40,000",
                monthDue: "6 months",
                minGuaranteePercentage: "11%",
              ),
              InvestmentCard(
                avatar: "assets/icons/truck_green.svg",
                investmentType: "Transportation",
                percentageDone: "12%",
                minAmount: "N40,000",
                monthDue: "6 months",
                minGuaranteePercentage: "11%",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
