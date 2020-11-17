import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/components/basic/custom_prefix_icon.dart';
import 'package:selcapital/components/buttons/primary_block.dart';
import 'package:selcapital/screens/onboarding/login.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/size_config.dart';
import 'package:selcapital/providers/user.dart';

class ForgotPassword extends StatefulWidget {
  static String routeName = "/forgot_password";

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final snackBar = SnackBar(
    backgroundColor: kTextColorGrey,
    content: Text(
      'This Email is not registered',
      style: TextStyle(
          fontSize: 15,
          fontFamily: "Poppins",
          color: Colors.white,
          fontWeight: FontWeight.bold),
    ),
  );

  int s = 1;
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(builder: (context, user, child) {
      return Scaffold(
        body: Container(
          margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(18), 0,
              getProportionateScreenWidth(18), 0),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, LoginScreen.routeName),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        0,
                        getProportionateScreenHeight(26),
                        0,
                        getProportionateScreenHeight(36)),
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset(
                      "assets/icons/arrow_left_circle.svg",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(5), 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Forgot Password?",
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
                  margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(3),
                      getProportionateScreenHeight(10), 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Please enter your email to reset your password",
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
                        getProportionateScreenHeight(36)),
                    decoration: BoxDecoration(
                      border: Border.all(color: kStrokeColorDark),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(8)),
                    child: buildEmailFormField()),
                Container(
                  child: IndexedStack(
                    index: s,
                    children: [
                      Center(
                        child: CircularProgressIndicator(
                          value: null,
                        ),
                      ),
                      PrimaryBlockButton(
                        text: "Reset",
                        press: () async {
                          // Scaffold.of(context).showSnackBar(snackBar);
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            setState(() {
                              s = 0;
                            });
                            bool isLoggedIn = await user.resetPassword(email);
                            if (isLoggedIn) {
                              Navigator.popAndPushNamed(
                                  context, LoginScreen.routeName);
                            } else {
                              Fluttertoast.showToast(
                                msg: "This email is not registered!",
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: "Your E-mail",
        hintStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Poppins",
          color: kTextColorGrey,
        ),
        prefixIcon: CustomPrefixIcon(
          svgIcon: "assets/icons/message.svg",
        ),
      ),
    );
  }
}

class PasswordValidation extends StatefulWidget {
  static String routeName = "/password_validation";
  @override
  _PasswordValidationState createState() => _PasswordValidationState();
}

class _PasswordValidationState extends State<PasswordValidation> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  final List<String> errors = [];
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
                "Validate",
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
              margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(3),
                  getProportionateScreenHeight(10), 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Please enter the pin sent to your email",
                style: TextStyle(
                  color: kTextColorDark,
                  fontSize: 17,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(3),
                          getProportionateScreenHeight(24),
                          getProportionateScreenWidth(3),
                          getProportionateScreenHeight(0)),
                      decoration: BoxDecoration(
                        border: Border.all(color: kStrokeColorDark),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(8)),
                      child: buildPinFormField()),
                  Container(
                      margin: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(3),
                          getProportionateScreenHeight(17),
                          getProportionateScreenWidth(3),
                          getProportionateScreenHeight(0)),
                      decoration: BoxDecoration(
                        border: Border.all(color: kStrokeColorDark),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(8)),
                      child: buildPasswordFormField()),
                  Container(
                      margin: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(3),
                          getProportionateScreenHeight(17),
                          getProportionateScreenWidth(3),
                          getProportionateScreenHeight(24)),
                      decoration: BoxDecoration(
                        border: Border.all(color: kStrokeColorDark),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(8)),
                      child: buildConfirmPasswordFormField()),
                  PrimaryBlockButton(
                    text: "Proceed",
                    press: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: "Your new Password",
        hintStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Poppins",
          color: kTextColorGrey,
        ),
        prefixIcon: CustomPrefixIcon(
          svgIcon: "assets/icons/password_lock.svg",
        ),
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: "Confirm Password",
        hintStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Poppins",
          color: kTextColorGrey,
        ),
        prefixIcon: CustomPrefixIcon(
          svgIcon: "assets/icons/password_lock.svg",
        ),
      ),
    );
  }

  TextFormField buildPinFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: "6 digit Pin",
        hintStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Poppins",
          color: kTextColorGrey,
        ),
        prefixIcon: CustomPrefixIcon(
          svgIcon: "assets/icons/password_icon.svg",
        ),
      ),
    );
  }
}
