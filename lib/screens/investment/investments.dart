import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:selcapital/components/cards/investment.dart';
import 'package:selcapital/screens/plans/add_plan.dart';
import 'package:selcapital/screens/investment/investment_detail.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/size_config.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/providers/investment.dart';

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
        iconTheme: new IconThemeData(color: kTextColorGrey),
        actions: [
          PopupMenuButton<int>(
              color: Colors.white,
              itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Text(
                        "Active",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF41414F),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text(
                        "Pending",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF41414F),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Text(
                        "History",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF41414F),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ])
        ],
      ),
      body: SingleChildScrollView(
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

class MyInvestmentScreenBody extends StatefulWidget {
  @override
  _MyInvestmentScreenBodyState createState() => _MyInvestmentScreenBodyState();
}

class _MyInvestmentScreenBodyState extends State<MyInvestmentScreenBody> {
  var formatter = new DateFormat('yyyy-MM-dd');

  int s = 1;
  // bool _emptyState = false;
  @override
  void initState() {
    super.initState();

    Provider.of<InvestmentModel>(context, listen: false).fetchInvestments();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InvestmentModel>(
      builder: (context, investment, child) {
        // switch (_emptyState) {
        //   case true:
        //   investment.investments.length
        //     s = 0;
        //     break;
        //   case false:
        //     s = 1;
        //     break;
        // }

        return
            //This is the indexed stack method, I am trying to vary the value of s depending on the length of the investment, but it's not working too.
            IndexedStack(
          index: s,
          children: [
            Container(
              margin: EdgeInsets.only(top: getProportionateScreenHeight(24)),
              child: Center(
                child: Text(
                  "No active Investments",
                  style: TextStyle(
                      color: kTextColorBlue,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.normal,
                      fontSize: 20),
                ),
              ),
            ),
            //it can be removed up to this point when you figure it out.
            ListView(
              shrinkWrap: true,
              children:
                  //this is the normal method, but it's not working too.
                  investment.investments.length == 0
                      // it's actually working when the condition is zero, but if i use '!=0', it doesn't work.
                      ? Container(
                          child: Text(
                            "No active Investments",
                            style: TextStyle(
                                color: kTextColorBlue,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.normal,
                                fontSize: 20),
                          ),
                        )
                      :
                      //you can delete it sha.. but if this works, the indexed stack is useless.
                      investment.investments
                          .map(
                            (singleInvestment) => GestureDetector(
                              onTap: () {
                                investment
                                    .setCurrentInvestment(singleInvestment);
                                Navigator.pushNamed(
                                    context, InvestmentDetailScreen.routeName);
                              },
                              child: InvestmentCard(
                                avatar: "assets/icons/cloud.svg",
                                title: singleInvestment['INVESTMENT_TITLE'],
                                maturity:
                                    "${singleInvestment['MATURITY_VALUE'] != null ? singleInvestment['MATURITY_VALUE'] : 0}%",
                                amount:
                                    "N ${singleInvestment['REQUEST_PRINCIPAL'] != null ? singleInvestment['REQUEST_PRINCIPAL'] : 0}",
                                duration:
                                    "${singleInvestment['REQUEST_TENOR'] != null ? singleInvestment['REQUEST_TENOR'] : 0} ${singleInvestment['LOAN_DURATION'] != null ? singleInvestment['LOAN_DURATION'] : 'months'}",
                                dueDate:
                                    "${formatter.format(singleInvestment['MATURITY_DATE'] != null ? singleInvestment['MATURITY_DATE'] : DateTime.now())}%",
                              ),
                            ),
                          )
                          .toList(),
            ),
          ],
        );
      },
    );
  }
}
