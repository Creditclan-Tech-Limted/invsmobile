import 'package:flutter/material.dart';
import 'package:selcapital/components/buttons/primary_block.dart';
import 'package:selcapital/screens/plans/vest_small/goal_target.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/size_config.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/providers/savings.dart';

class GoalTitleScreen extends StatelessWidget {
  static String routeName = "/goal_title";
  @override
  Widget build(BuildContext context) {
    return Consumer<SavingsModel>(
      builder: (context, savings, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: getProportionateScreenHeight(5),
            title: Text(
              "New Saving Plan",
            ),
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
                      margin: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(48)),
                      child: Text("What are you saving for?",
                          style: TextStyle(
                            letterSpacing: 1,
                            color: kTextColorBlue,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 23,
                          )),
                    ),
                    GoalTitleScreenBody(),
                  ],
                )),
          ),
        );
      },
    );
  }
}

class GoalTitleScreenBody extends StatefulWidget {
  @override
  _GoalTitleScreenBodyState createState() => _GoalTitleScreenBodyState();
}

class _GoalTitleScreenBodyState extends State<GoalTitleScreenBody> {
  TextEditingController _name = TextEditingController();

  @override
  void dispose() {
    _name.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SavingsModel>(
      builder: (context, savings, child) {
        return Container(
          child: Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: kStrokeColorDark),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.fromLTRB(
                    0, 0, 0, getProportionateScreenHeight(48)),
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(12)),
                alignment: Alignment.centerLeft,
                child: goalName(_name),
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
                margin: EdgeInsets.only(top: getProportionateScreenHeight(200)),
                child: PrimaryBlockButton(
                  text: "Continue",
                  press: () {
                    savings.addGoalName(_name.text);
                    Navigator.pushNamed(context, GoalTargetScreen.routeName);
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  TextFormField goalName(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: "Goal Name",
        hintStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: "Poppins",
          color: kTextColorGrey,
        ),
      ),
    );
  }
}
