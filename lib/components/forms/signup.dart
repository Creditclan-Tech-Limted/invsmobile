import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/components/basic/custom_prefix_icon.dart';
import 'package:selcapital/components/basic/form_error.dart';
import 'package:selcapital/components/buttons/primary_block.dart';
import 'package:selcapital/providers/accounts.dart';
import 'package:selcapital/providers/user.dart';
import 'package:selcapital/screens/profile/edit_profile.dart';
import 'package:selcapital/size_config.dart';
import 'package:selcapital/providers/options.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  DateTime selectedDate = DateTime.now();

  int _state = 0;
  String text = "choose DOB";

  final _formKey = GlobalKey<FormState>();
  int s = 1;
  String email;
  String password;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    switch (_state) {
      case 0:
        text = "choose DOB";
        break;

      case 1:
        text = ("${selectedDate.toLocal()}".split(' ')[0]);

        break;
    }

    return Consumer<AccountsModel>(
      builder: (context, account, child) {
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
                child: buildNameFormField(
                    '${account.accounts?.firstName} ${account.accounts?.lastName}'),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: kStrokeColorDark),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.fromLTRB(0, 17, 0, 0),
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
                child: buildPhoneNoFormField(account.accounts?.phone),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: kStrokeColorDark),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.fromLTRB(0, 17, 0, 0),
                alignment: Alignment.centerLeft,
                child: buildDobFormField(account.accounts?.dob),
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
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: kStrokeColorDark),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.fromLTRB(0, 17, 0, 0),
                alignment: Alignment.centerLeft,
                child: buildConfirmPasswordFormField(),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    0, 0, 0, getProportionateScreenHeight(20)),
                alignment: Alignment.centerLeft,
                child: FormError(errors: errors),
              ),
              Consumer<UserModel>(builder: (context, user, child) {
                return Container(
                  child: IndexedStack(
                    index: s,
                    children: [
                      Center(
                        child: CircularProgressIndicator(
                          value: null,
                        ),
                      ),
                      PrimaryBlockButton(
                        text: "Sign Up",
                        press: () async {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            setState(() {
                              s = 0;
                            });
                            bool isLoggedIn = await user.register(
                              '${account.accounts?.firstName} ${account.accounts?.lastName}',
                              email,
                              account.accounts?.phone,
                              account.accounts?.dob,
                              password,
                              account.bvn,
                            );
                            if (isLoggedIn) {
                              Provider.of<OptionsModel>(context, listen: false)
                                  .loadOptions();
                              Navigator.pushNamed(
                                  context, EditProfileScreen.routeName);
                            }
                            setState(() {
                              s = 1;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                );
              })
            ],
          ),
        );
      },
    );
  }

  TextFormField buildNameFormField(String firstName) {
    return TextFormField(
      enabled: false,
      initialValue: firstName,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: "Full Name",
        hintStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Poppins",
          color: kTextColorGrey,
        ),
        prefixIcon: CustomPrefixIcon(
          svgIcon: "assets/icons/user.svg",
        ),
      ),
    );
  }

  TextFormField buildPhoneNoFormField(String phone) {
    return TextFormField(
      enabled: false,
      initialValue: phone,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: "Phone Number",
        hintStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Poppins",
          color: kTextColorGrey,
        ),
        prefixIcon: CustomPrefixIcon(
          svgIcon: "assets/icons/user.svg",
        ),
      ),
    );
  }

  TextFormField buildDobFormField(String dob) {
    return TextFormField(
      enabled: false,
      initialValue: dob,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: "Date of Birth",
        hintStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Poppins",
          color: kTextColorGrey,
        ),
        prefixIcon: CustomPrefixIcon(
          svgIcon: "assets/icons/calendar.svg",
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
}
