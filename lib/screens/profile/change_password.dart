import 'package:flutter/material.dart';
import 'package:selcapital/components/buttons/primary_block.dart';
import 'package:selcapital/size_config.dart';
import 'package:selcapital/constants.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/providers/user.dart';

class ChangePasswordScreen extends StatefulWidget {
  static String routeName = "/change_password";

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordScreen> {
  int s = 1;
  final _formKey = GlobalKey<FormState>();
  String currentPassword;
  String newPassword;
  String confirmPassword;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
      builder: (context, user, child) {
        return new Scaffold(
          appBar: new AppBar(
            title: new Text("Change Password"),
            automaticallyImplyLeading: true,
          ),
          body: Container(
            padding: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  Center(
                    child: Container(
                        height: getProportionateScreenHeight(150),
                        width: getProportionateScreenWidth(150),
                        child: Image.asset(
                          "assets/images/lock_image.png",
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                        )),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(8)),
                    decoration: BoxDecoration(
                      border: Border.all(color: kStrokeColorDark),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      obscureText: true,
                      onSaved: (newValue) => currentPassword = newValue,
                      onChanged: (value) {
                        if (value.isNotEmpty &&
                            errors.contains(kPassNullError)) {
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
                        hintText: "Old password",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          color: kTextColorGrey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(24),
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(8)),
                    decoration: BoxDecoration(
                      border: Border.all(color: kStrokeColorDark),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      obscureText: true,
                      onSaved: (newValue) => newPassword = newValue,
                      onChanged: (value) {
                        if (value.isNotEmpty &&
                            errors.contains(kPassNullError)) {
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
                        hintText: "New password",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          color: kTextColorGrey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(24),
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(8)),
                    decoration: BoxDecoration(
                      border: Border.all(color: kStrokeColorDark),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      obscureText: true,
                      onSaved: (newValue) => confirmPassword = newValue,
                      onChanged: (value) {
                        if (value.isNotEmpty &&
                            errors.contains(kPassNullError)) {
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
                        hintText: "Confirm new password",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          color: kTextColorGrey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(120),
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
                          text: "Change",
                          press: () async {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              setState(() {
                                s = 0;
                              });
                              bool isLoggedIn = await user.editPassword(
                                currentPassword,
                                newPassword,
                                confirmPassword,
                              );
                              if (isLoggedIn) {
                                Navigator.pop(context);
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
      },
    );
  }
}
