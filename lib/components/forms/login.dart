import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/components/basic/custom_prefix_icon.dart';
import 'package:selcapital/components/basic/form_error.dart';
import 'package:selcapital/components/buttons/primary_block.dart';
import 'package:selcapital/providers/user.dart';
import 'package:selcapital/size_config.dart';
import 'package:selcapital/screens/bottom_nav.dart';
import 'package:selcapital/providers/options.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  int s = 1;
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
      builder: (context, user, child) {
        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: kStrokeColorDark),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: buildEmailFormField(),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: kStrokeColorDark),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.fromLTRB(0, 17, 0, 0),
                alignment: Alignment.centerLeft,
                child: buildPasswordFormField(),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    0, 0, 0, getProportionateScreenHeight(36)),
                alignment: Alignment.centerLeft,
                child: FormError(errors: errors),
              ),
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
                      text: "Login",
                      press: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          setState(() {
                            s = 0;
                          });
                          bool isLoggedIn = await user.login(email, password);
                          if (isLoggedIn) {
                            Provider.of<OptionsModel>(context, listen: false)
                                .loadOptions();
                            Navigator.popAndPushNamed(
                                context, BottomNavigation.routeName);
                          } else {
                            Fluttertoast.showToast(
                              msg: "Incorrect email or password!",
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
        );
      },
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
        hintText: "Your Password",
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
