import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selcapital/components/buttons/primary_block.dart';
import 'package:selcapital/screens/plans/successful.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/size_config.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/providers/investment.dart';

class ProductDetailMore extends StatelessWidget {
  static String routeName = "/product_detail_more";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: getProportionateScreenHeight(5),
        title: Text(
          "Back to list",
        ),
        automaticallyImplyLeading: true,
        iconTheme: new IconThemeData(color: kTextColorGrey),
        actions: [
          PopupMenuButton<int>(
              color: Colors.white,
              itemBuilder: (context) => [
                    PopupMenuItem(value: 1, child: Text("")),
                    PopupMenuItem(value: 2, child: Text("")),
                  ])
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ProductDetailTwoBody(),
      ),
    );
  }
}

class ProductDetailTwoBody extends StatefulWidget {
  @override
  _ProductDetailTwoBodyState createState() => _ProductDetailTwoBodyState();
}

class _ProductDetailTwoBodyState extends State<ProductDetailTwoBody> {
  TextEditingController _amount = TextEditingController();
  TextEditingController _duration = TextEditingController();
  int s = 1;

  @override
  void dispose() {
    _amount.dispose();
    _duration.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InvestmentModel>(
      builder: (context, investment, child) {
        return SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(24),
                getProportionateScreenHeight(56),
                getProportionateScreenWidth(16),
                getProportionateScreenHeight(18)),
            child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(bottom: getProportionateScreenHeight(30)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(investment.currentProduct['INVESTMENT_TITLE'],
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF12121F),
                            fontSize: 18,
                          )),
                      SizedBox(
                        height: getProportionateScreenHeight(4),
                      ),
                      Row(
                        children: [
                          Text(
                            "Rate:",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              color: kTextColorGrey,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(5),
                          ),
                          Text(
                            "${investment.currentProduct['STATUS'] != null ? investment.currentProduct['STATUS'] : 0}%",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF40BFFF),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: getProportionateScreenHeight(30)),
                  width: double.infinity,
                  child: SvgPicture.asset(
                    "assets/icons/stroke.svg",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(0),
                      getProportionateScreenHeight(0),
                      getProportionateScreenWidth(0),
                      getProportionateScreenHeight(10)),
                  padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(0),
                      getProportionateScreenHeight(8),
                      getProportionateScreenWidth(24),
                      getProportionateScreenHeight(48)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "N ${investment.currentProduct['INVESTMENT_AMOUNT'] != null ? investment.currentProduct['INVESTMENT_AMOUNT'] : 0}",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF41414F),
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Min Amount",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFF8A33A),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${investment.currentProduct['TENOR'] != null ? investment.currentProduct['TENOR'] : 0} ${investment.currentProduct['LD'] != null ? investment.currentProduct['LD'] : 'months'}",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF41414F),
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Min duration",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFF8A33A),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${investment.currentProduct['INTEREST'] != null ? investment.currentProduct['INTEREST'] : 0}%",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF41414F),
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Min guarantee",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFF8A33A),
                                fontSize: 11,
                              ),
                            ),
                          ])
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: kStrokeColorDark),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.fromLTRB(
                      0, 0, 0, getProportionateScreenHeight(16)),
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(12)),
                  alignment: Alignment.centerLeft,
                  child: buildReason1FormField(_amount),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: kStrokeColorDark),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.fromLTRB(
                      0, 0, 0, getProportionateScreenHeight(16)),
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(12)),
                  alignment: Alignment.centerLeft,
                  child: buildReason2FormField(_duration),
                ),
                // Container(
                //   height: 50,
                //   decoration: BoxDecoration(
                //     border: Border.all(color: kStrokeColorDark),
                //     borderRadius: BorderRadius.circular(5),
                //   ),
                //   padding: EdgeInsets.symmetric(
                //       horizontal: getProportionateScreenWidth(12)),
                //   margin: EdgeInsets.fromLTRB(
                //       0, 0, 0, getProportionateScreenHeight(50)),
                //   alignment: Alignment.centerLeft,
                //   child: buildReason3FormField(),
                // ),
                IndexedStack(
                  index: s,
                  children: [
                    Center(
                      child: CircularProgressIndicator(
                        value: null,
                      ),
                    ),
                    PrimaryBlockButton(
                      text: "Invest",
                      press: () async {
                        setState(() {
                          s = 0;
                        });
                        bool isSaved =
                            await investment.save(_amount.text, _duration.text);
                        if (isSaved) {
                          Navigator.pushNamed(
                              context, SuccesfulScreen.routeName);
                        }
                        setState(() {
                          s = 1;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  TextFormField buildReason1FormField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: "How much do you want to invest",
        hintStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Poppins",
          color: kTextColorGrey,
        ),
      ),
    );
  }

  TextFormField buildReason2FormField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: "For how long",
        hintStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Poppins",
          color: kTextColorGrey,
        ),
      ),
    );
  }

  TextFormField buildReason3FormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: "Choose a source of funds",
        hintStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Poppins",
          color: kTextColorGrey,
        ),
      ),
    );
  }
}
