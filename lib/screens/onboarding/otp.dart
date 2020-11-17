import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/components/buttons/primary_block.dart';
import 'package:selcapital/components/buttons/secondary_block.dart';
import 'package:selcapital/providers/accounts.dart';
import 'package:selcapital/screens/onboarding/signup.dart';

import '../../constants.dart';
import '../../size_config.dart';

class OTPscreen extends StatefulWidget {
  static String routeName = "/otp_up";
  @override
  _OTPscreenState createState() => _OTPscreenState();
}

class _OTPscreenState extends State<OTPscreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String otp;
  int s = 0;
  int y = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Consumer<AccountsModel>(builder: (context, account, child) {
          return Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(getProportionateScreenHeight(50)),
                  topRight: Radius.circular(getProportionateScreenHeight(50)),
                ),
              ),

              //  (MediaQuery.of(context).size.height * 10) - 500,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(24),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            getProportionateScreenWidth(5), 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Verify OTP",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 28,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: getProportionateScreenWidth(250),
                        margin: EdgeInsets.fromLTRB(
                            getProportionateScreenWidth(3),
                            getProportionateScreenHeight(24),
                            0,
                            getProportionateScreenHeight(16)),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter OTP sent to the phone number  registered to BVN provided",
                          style: TextStyle(
                            color: kTextColorDark,
                            fontSize: 17,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(
                              getProportionateScreenWidth(3),
                              getProportionateScreenHeight(36),
                              getProportionateScreenWidth(3),
                              getProportionateScreenHeight(60)),
                          decoration: BoxDecoration(
                            border: Border.all(color: kStrokeColorDark),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(8)),
                          child: buildOTPFormField()),
                      IndexedStack(
                        index: s,
                        children: [
                          SecondaryBlockButton(
                            text: "Submit",
                          ),
                          PrimaryBlockButton(
                            text: "Submit",
                            press: () async {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                setState(() {
                                  s = 2;
                                });
                                bool validOTP = await account.validateBvn(
                                    otp, account.accounts?.txn);
                                if (validOTP) {
                                  Navigator.pushNamed(
                                      context, SignUpScreen.routeName);
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "OTP is not correct!",
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
                            },
                          ),
                          Center(
                            child: CircularProgressIndicator(
                              value: null,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
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
            s = 1;
          });
        } else if (value.isEmpty && errors.contains(kBvNShortError)) {
          setState(() {
            errors.add(kBVNNullError);
            errors.remove(kBvNShortError);
            s = 0;
          });
        } else if (value.length > 6) {
          setState(() {
            errors.add(kBvNLongError);
            errors.remove(kBVNNullError);
            s = 0;
          });
        } else if (value.length >= 1 &&
            value.length < 6 &&
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
