import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:selcapital/components/cards/investment.dart';
import 'package:selcapital/screens/plans/vest_later/product_detail.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/size_config.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/providers/investment.dart';

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
  var formatter = new DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();

    Provider.of<InvestmentModel>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InvestmentModel>(
      builder: (context, investment, child) {
        return SingleChildScrollView(
          child: Column(
            children: investment.products
                .map(
                  (product) => GestureDetector(
                    onTap: () {
                      investment.setCurrentProduct(product);
                      Navigator.pushNamed(
                          context, ProductDetailScreen.routeName);
                    },
                    child: InvestmentCard(
                      avatar: "assets/icons/cloud.svg",
                      title: product['INVESTMENT_TITLE'],
                      maturity:
                          "${product['MATURITY_VALUE'] != null ? product['MATURITY_VALUE'] : 0}%",
                      amount:
                          "N ${product['REQUEST_PRINCIPAL'] != null ? product['REQUEST_PRINCIPAL'] : 0}",
                      duration:
                          "${product['REQUEST_TENOR'] != null ? product['REQUEST_TENOR'] : 0} ${product['LOAN_DURATION'] != null ? product['LOAN_DURATION'] : 'months'}",
                      dueDate:
                          "${formatter.format(product['MATURITY_DATE'] != null ? product['MATURITY_DATE'] : DateTime.now())}%",
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
