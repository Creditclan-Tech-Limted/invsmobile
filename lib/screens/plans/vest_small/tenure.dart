import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/svg.dart';
import 'package:selcapital/components/buttons/primary_block.dart';
import 'package:selcapital/screens/plans/successful.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/size_config.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/providers/savings.dart';

class TenureScreen extends StatelessWidget {
  static String routeName = "/tenure";
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
                  child: Text("How long would you like to save for?",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: kTextColorBlue,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 23,
                      )),
                ),
                TenureScreenBody(),
              ],
            )),
      ),
    );
  }
}

class TenureScreenBody extends StatefulWidget {
  @override
  _TenureScreenBodyState createState() => _TenureScreenBodyState();
}

class _TenureScreenBodyState extends State<TenureScreenBody> {
  bool _selected = false;
  int _state = 1;
  int s = 1;

  DateTime selectedDate = DateTime.now();
  String text = "I'll choose a preferred date";
  var formatter = new DateFormat('yyyy');
  int _selectedInterval;

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _selectedInterval = (int.tryParse(formatter.format(selectedDate)) -
                int.tryParse(formatter.format(DateTime.now()))) *
            12;
      });
  }

  @override
  Widget build(BuildContext context) {
    switch (_state) {
      case 0:
        _selected = false;
        break;
      case 1:
        _selected = true;
        text = "I'll choose a preferred date";
        break;
      case 2:
        _selected = true;
        text = "I'll choose a preferred date";
        break;
      case 4:
        _selected = true;
        text = ("${selectedDate.toLocal()}".split(' ')[0]);
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
                    "1 year",
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
                      0, 0, 0, getProportionateScreenHeight(16)),
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(12)),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "2 years",
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
                    _state = 3;
                  });
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: _state == 3 && _selected == true
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
                    "3 years",
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
                  _selectDate(context);
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
                      0, 0, 0, getProportionateScreenHeight(48)),
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(12)),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$text",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          color: kTextColorGrey,
                        ),
                      ),
                      SvgPicture.asset("assets/icons/calendar.svg")
                    ],
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
                margin: EdgeInsets.only(top: getProportionateScreenHeight(20)),
                child: IndexedStack(
                  index: s,
                  children: [
                    Center(
                      child: CircularProgressIndicator(
                        value: null,
                      ),
                    ),
                    PrimaryBlockButton(
                      text: "Create Plan",
                      press: () async {
                        setState(() {
                          s = 0;
                        });
                        savings.addDuration(_state == 1
                            ? '12'
                            : _state == 2
                                ? '24'
                                : _state == 3
                                    ? '36'
                                    : '${_selectedInterval == 0 ? 12 : _selectedInterval}');
                        bool isSaved = await savings.save();
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
              )
            ],
          ),
        );
      },
    );
  }
}
