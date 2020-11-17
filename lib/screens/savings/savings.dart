import 'package:flutter/material.dart';
import 'package:selcapital/components/cards/active_plans.dart';
import 'package:selcapital/screens/plans/add_plan.dart';
import 'package:selcapital/screens/savings/savings_detail.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/size_config.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/providers/savings.dart';

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
      body: SingleChildScrollView(
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
      backgroundColor: kBackgroundColor,
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
  void initState() {
    super.initState();

    Provider.of<SavingsModel>(context, listen: false).fetchSavings();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SavingsModel>(
      builder: (context, savings, child) {
        return ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: savings.savings
              .map(
                (saving) => GestureDetector(
                  onTap: () {
                    savings.setCurrentSavings(saving);
                    Navigator.pushNamed(context, SavingsDetailScreen.routeName);
                  },
                  child: ActivePlansCard(
                    planType: saving['TARGET_TITLE'],
                    maturityDate:
                        "${saving['TOTAL_INTERESTS'] != null ? saving['TOTAL_INTERESTS'] : 0}%",
                    balance:
                        "N ${saving['CURRENT_BALANCE'] != null ? saving['CURRENT_BALANCE'] : 0}",
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
