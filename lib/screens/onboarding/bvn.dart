import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/components/basic/form_error.dart';
import 'package:selcapital/components/buttons/primary_block.dart';
import 'package:selcapital/components/buttons/secondary_block.dart';
import 'package:selcapital/components/texts/have_account.dart';
import 'package:selcapital/providers/accounts.dart';
import 'package:selcapital/screens/onboarding/login.dart';
import 'package:selcapital/screens/onboarding/otp.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/size_config.dart';

class BvnValidation extends StatefulWidget {
  static String routeName = "/bvn_up";

  @override
  _BvnValidationState createState() => _BvnValidationState();
}

class _BvnValidationState extends State<BvnValidation> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String bvn;
  String otp;
  String tnx;
  int s = 0;
  int y = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(18), 0,
            getProportionateScreenWidth(18), 0),
        child: ListView(
          shrinkWrap: true,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, LoginScreen.routeName),
              child: Container(
                margin: EdgeInsets.fromLTRB(0, getProportionateScreenHeight(26),
                    0, getProportionateScreenHeight(36)),
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  "assets/icons/arrow_left_circle.svg",
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.fromLTRB(getProportionateScreenWidth(5), 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Provide BVN",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 28,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(3),
                  getProportionateScreenHeight(10), 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                "BVN validation is required",
                style: TextStyle(
                  color: kTextColorDark,
                  fontSize: 17,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Consumer<AccountsModel>(builder: (context, account, child) {
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(
                            getProportionateScreenWidth(3),
                            getProportionateScreenHeight(36),
                            getProportionateScreenWidth(3),
                            getProportionateScreenHeight(8)),
                        decoration: BoxDecoration(
                          border: Border.all(color: kStrokeColorDark),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(8)),
                        child: buildBVNFormField()),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0, 0, 0, getProportionateScreenHeight(80)),
                      alignment: Alignment.centerLeft,
                      child: FormError(errors: errors),
                    ),
                    IndexedStack(
                      index: s,
                      children: [
                        SecondaryBlockButton(
                          text: "Validate",
                        ),
                        PrimaryBlockButton(
                            text: "Validate",
                            press: () async {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                setState(() {
                                  s = 2;
                                });
                                bool validBVN = await account.sendBvn(bvn);
                                if (validBVN) {
                                  Navigator.pushNamed(
                                      context, OTPscreen.routeName);
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Invalid BVN!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.SNACKBAR,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: kPrimaryColor,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                }
                                setState(() {
                                  s = 1;
                                });
                              }
                            }),
                        Center(
                          child: CircularProgressIndicator(
                            value: null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
            Container(
                margin: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(3),
                    getProportionateScreenHeight(36),
                    getProportionateScreenWidth(3),
                    getProportionateScreenHeight(36)),
                child: HaveAccountText())
          ],
        ),
      ),
    );
  }

  TextFormField buildBVNFormField() {
    return TextFormField(
      onSaved: (newValue) => bvn = newValue,
      onChanged: (value) {
        if (value.length == 11) {
          setState(() {
            errors.remove(kBVNNullError);
            errors.remove(kBvNLongError);
            errors.remove(kBvNShortError);
            s = 1;
          });
        } else if (value.isEmpty && errors.contains(kBvNShortError)) {
          setState(() {
            errors.add(kBVNNullError);
            errors.remove(kBvNShortError);
            s = 0;
          });
        } else if (value.length > 11) {
          setState(() {
            errors.add(kBvNLongError);
            errors.remove(kBVNNullError);
            s = 0;
          });
        } else if (value.length >= 1 &&
            value.length < 11 &&
            !errors.contains(kBvNShortError)) {
          setState(() {
            errors.add(kBvNShortError);
            errors.remove(kBVNNullError);
            s = 0;
          });
        }
        return null;
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: "Enter BVN here",
        hintStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Poppins",
          color: kTextColorGrey,
        ),
      ),
    );
  }

  TextFormField buildOTPFormField() {
    return TextFormField(
      onSaved: (newValue) => otp = newValue,
      onChanged: (value) {
        if (value.length == 6) {
          setState(() {
            errors.remove(kBVNNullError);
            errors.remove(kBvNLongError);
            errors.remove(kBvNShortError);
            y = 1;
          });
        } else if (value.isEmpty && errors.contains(kBvNShortError)) {
          setState(() {
            errors.add(kBVNNullError);
            errors.remove(kBvNShortError);
            y = 0;
          });
        } else if (value.length > 6) {
          setState(() {
            errors.add(kBvNLongError);
            errors.remove(kBVNNullError);
            y = 0;
          });
        } else if (value.length >= 1 &&
            value.length < 6 &&
            !errors.contains(kBvNShortError)) {
          setState(() {
            errors.add(kBvNShortError);
            errors.remove(kBVNNullError);
            y = 0;
          });
        }
        return null;
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: "Enter OTP here",
        hintStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Poppins",
          color: kTextColorGrey,
        ),
      ),
    );
  }
}
