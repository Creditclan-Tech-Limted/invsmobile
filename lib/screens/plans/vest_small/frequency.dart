import 'package:flutter/material.dart';
import 'package:selcapital/components/buttons/primary_block.dart';
import 'package:selcapital/screens/plans/vest_small/amount.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/size_config.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/providers/savings.dart';

class FrequencyScreen extends StatelessWidget {
  static String routeName = "/frequency";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: getProportionateScreenHeight(5),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(16),
                getProportionateScreenHeight(32),
                getProportionateScreenWidth(16),
                getProportionateScreenHeight(24)),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(bottom: getProportionateScreenHeight(48)),
                  child: Text("How often would you like to save for this goal?",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: kTextColorBlue,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 23,
                      )),
                ),
                FrequencyScreenBody(),
              ],
            )),
      ),
    );
  }
}

class FrequencyScreenBody extends StatefulWidget {
  @override
  _FrequencyScreenBodyState createState() => _FrequencyScreenBodyState();
}

class _FrequencyScreenBodyState extends State<FrequencyScreenBody> {
  bool _selected = false;
  int _state = 1;

  @override
  Widget build(BuildContext context) {
    switch (_state) {
      case 0:
        _selected = false;
        break;
      case 1:
        _selected = true;
        break;
      case 4:
        _selected = true;
        break;
      case 2:
        _selected = true;
        break;
    }
    return Consumer<SavingsModel>(
      builder: (context, savings, child) {
        return Container(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _state = 1;
                  });
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: _state == 1 && _selected == true
                            ? kStrokeColorDark
                            : Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.fromLTRB(
                      0, 0, 0, getProportionateScreenHeight(16)),
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(12)),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Once a day",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                      color: kTextColorGrey,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _state = 4;
                  });
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: _state == 4 && _selected == true
                            ? kStrokeColorDark
                            : Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.fromLTRB(
                      0, 0, 0, getProportionateScreenHeight(16)),
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(12)),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Once a week",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                      color: kTextColorGrey,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _state = 2;
                  });
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: _state == 2 && _selected == true
                            ? kStrokeColorDark
                            : Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.fromLTRB(
                      0, 0, 0, getProportionateScreenHeight(48)),
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(12)),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Once a month",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                      color: kTextColorGrey,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(0),
                    getProportionateScreenHeight(0),
                    getProportionateScreenWidth(16),
                    getProportionateScreenHeight(24)),
                child: Text("",
                    style: TextStyle(
                      letterSpacing: 1,
                      color: Color(0xFF9098B1),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: getProportionateScreenHeight(70)),
                child: PrimaryBlockButton(
                  text: "Continue",
                  press: () {
                    savings.addFrequency('$_state');
                    Navigator.pushNamed(context, AmountScreen.routeName);
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
