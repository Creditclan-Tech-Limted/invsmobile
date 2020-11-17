import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selcapital/components/buttons/primary_block.dart';
import 'package:selcapital/components/buttons/secondary_block.dart';
import 'package:selcapital/screens/plans/vest_later/product_detail_more.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/size_config.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/providers/investment.dart';

class ProductDetailScreen extends StatelessWidget {
  static String routeName = "/product_detail";
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
      body: Container(color: Colors.white, child: ProductDetailScreenBody()),
    );
  }
}

class ProductDetailScreenBody extends StatefulWidget {
  @override
  _ProductDetailScreenBodyState createState() =>
      _ProductDetailScreenBodyState();
}

class _ProductDetailScreenBodyState extends State<ProductDetailScreenBody> {
  int _pageState = 0;
  double windowWidth = 0;
  double windowHeight = 0;
  double _moreInfoOffset = 0;
  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;
    switch (_pageState) {
      case 0:
        _moreInfoOffset = windowHeight;
        break;
      case 1:
        _moreInfoOffset = getProportionateScreenHeight(180);
        break;
    }
    return Consumer<InvestmentModel>(
      builder: (context, investment, child) {
        return Container(
          child: Stack(children: [
            Column(children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _pageState = 0;
                  });
                },
                child: Container(
                  height: getProportionateScreenHeight(270),
                  child: Image.asset(
                    "assets/images/plan-detail-2.png",
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                margin: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(0),
                    getProportionateScreenHeight(0),
                    getProportionateScreenWidth(0),
                    getProportionateScreenHeight(0)),
                padding: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(16),
                    getProportionateScreenHeight(20),
                    getProportionateScreenWidth(16),
                    getProportionateScreenHeight(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  investment.currentProduct['INVESTMENT_TITLE'],
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold,
                                    color: kTextColorBlue,
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
                                    width: getProportionateScreenWidth(2),
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
                          Spacer(),
                          SvgPicture.asset("assets/icons/favourite.svg")
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(0),
                          getProportionateScreenHeight(10),
                          getProportionateScreenWidth(0),
                          getProportionateScreenHeight(0)),
                      padding: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(0),
                          getProportionateScreenHeight(18),
                          getProportionateScreenWidth(24),
                          getProportionateScreenHeight(18)),
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
                      margin: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(0),
                          getProportionateScreenHeight(0),
                          getProportionateScreenWidth(0),
                          getProportionateScreenHeight(10)),
                      padding: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(8),
                          getProportionateScreenHeight(18),
                          getProportionateScreenWidth(8),
                          getProportionateScreenHeight(18)),
                      child: Text(
                          investment.currentProduct['INVESTMENT_DESCRIPTION']),
                    ),
                    PrimaryBlockButton(
                      text: "Invest Now",
                      press: () {
                        Navigator.pushNamed(
                            context, ProductDetailMore.routeName);
                      },
                    ),
                    SecondaryBlockButton(
                      text: "More Info",
                      press: () {
                        setState(() {
                          _pageState = 1;
                        });
                      },
                    )
                  ],
                ),
              ),
            ]),
            AnimatedContainer(
                margin: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(0),
                    getProportionateScreenHeight(60),
                    getProportionateScreenWidth(0),
                    getProportionateScreenHeight(0)),
                duration: Duration(milliseconds: 1000),
                curve: Curves.fastLinearToSlowEaseIn,
                transform: Matrix4.translationValues(
                  getProportionateScreenWidth(0),
                  getProportionateScreenHeight(_moreInfoOffset),
                  1,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(getProportionateScreenHeight(45)),
                      topRight:
                          Radius.circular(getProportionateScreenHeight(45)),
                    )),
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(24),
                      getProportionateScreenHeight(80),
                      getProportionateScreenWidth(24),
                      getProportionateScreenHeight(10)),
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("About",
                            style: TextStyle(
                              color: Color(0xFFF15F79),
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            getProportionateScreenWidth(0),
                            getProportionateScreenHeight(0),
                            getProportionateScreenWidth(0),
                            getProportionateScreenHeight(10)),
                        padding: EdgeInsets.fromLTRB(
                            getProportionateScreenWidth(0),
                            getProportionateScreenHeight(30),
                            getProportionateScreenWidth(0),
                            getProportionateScreenHeight(30)),
                        child: Text(
                            investment.currentProduct['INVESTMENT_DESCRIPTION'],
                            style: TextStyle(
                              letterSpacing: 1,
                              color: kTextColorGrey,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            )),
                      ),
                      PrimaryBlockButton(
                        text: "Invest Now",
                        press: () {
                          Navigator.pushNamed(
                              context, ProductDetailMore.routeName);
                        },
                      )
                    ],
                  ),
                )),
          ]),
        );
      },
    );
  }
}
