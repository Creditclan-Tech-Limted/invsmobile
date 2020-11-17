import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/screens/onboarding/login.dart';
import 'package:selcapital/screens/profile/accounts_and_cards.dart';
import 'package:selcapital/screens/profile/change_password.dart';
import 'package:selcapital/screens/profile/edit_profile.dart';
import 'package:selcapital/size_config.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/providers/user.dart';

class AccountScreen extends StatefulWidget {
  static String routeName = "/account_screen";
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
      builder: (context, user, child) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: getProportionateScreenHeight(24),
                      bottom: getProportionateScreenHeight(24)),
                  child: ListTile(
                    title: Text(
                      "My Account",
                      style: TextStyle(
                          color: kTextColorBlue,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    subtitle: Text(
                      "${user.user?.profile?.name}",
                      style: TextStyle(
                          color: kTextColorDark,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.normal,
                          fontSize: 13),
                    ),
                    trailing: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: user.user?.profile?.picture != null
                                ? NetworkImage('${user.user?.profile?.picture}')
                                : AssetImage('assets/images/plan-1.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(12)),
                  decoration: BoxDecoration(
                      color: Color(0xffFE9E49),
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenHeight(10))),
                  padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(18),
                      getProportionateScreenHeight(25),
                      getProportionateScreenWidth(18),
                      getProportionateScreenHeight(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: getProportionateScreenWidth(40),
                        margin: EdgeInsets.fromLTRB(
                            0, getProportionateScreenHeight(4), 20, 0),
                        child: SvgPicture.asset("assets/icons/clock_alt.svg"),
                      ),
                      Container(
                        // width: getProportionateScreenWidth(220),
                        padding: EdgeInsets.fromLTRB(
                            0, 0, getProportionateScreenWidth(50), 0),
                        child: Text(
                          "Complete Your account\nsetup",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenWidth(13),
                              color: Colors.white),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, EditProfileScreen.routeName),
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(12),
                      getProportionateScreenHeight(54),
                      getProportionateScreenWidth(12),
                      getProportionateScreenHeight(0),
                    ),
                    padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(0),
                      getProportionateScreenHeight(12),
                      getProportionateScreenWidth(0),
                      getProportionateScreenHeight(24),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/edit_profile.svg"),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(30),
                          ),
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.normal,
                              fontSize: getProportionateScreenWidth(13),
                              color: Color(0xFF4F4F4F),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: getProportionateScreenHeight(0)),
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenHeight(12),
                  ),
                  width: double.infinity,
                  child: SvgPicture.asset(
                    "assets/icons/stroke.svg",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, AccountsAndCardsScreen.routeName),
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(12),
                      getProportionateScreenHeight(0),
                      getProportionateScreenWidth(12),
                      getProportionateScreenHeight(0),
                    ),
                    padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(0),
                      getProportionateScreenHeight(24),
                      getProportionateScreenWidth(0),
                      getProportionateScreenHeight(24),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/credit-card.svg"),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(30),
                          ),
                          child: Text(
                            "Account & Cards",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.normal,
                              fontSize: getProportionateScreenWidth(13),
                              color: Color(0xFF4F4F4F),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: getProportionateScreenHeight(6)),
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenHeight(12),
                  ),
                  width: double.infinity,
                  child: SvgPicture.asset(
                    "assets/icons/stroke.svg",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, ChangePasswordScreen.routeName),
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(12),
                      getProportionateScreenHeight(0),
                      getProportionateScreenWidth(12),
                      getProportionateScreenHeight(0),
                    ),
                    padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(0),
                      getProportionateScreenHeight(24),
                      getProportionateScreenWidth(0),
                      getProportionateScreenHeight(24),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/password_icon.svg"),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(30),
                          ),
                          child: Text(
                            "Change Password",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.normal,
                              fontSize: getProportionateScreenWidth(13),
                              color: Color(0xFF4F4F4F),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: getProportionateScreenHeight(6)),
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenHeight(12),
                  ),
                  width: double.infinity,
                  child: SvgPicture.asset(
                    "assets/icons/stroke.svg",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await user.logout();
                    Navigator.popAndPushNamed(context, LoginScreen.routeName);
                  },
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(12),
                      getProportionateScreenHeight(0),
                      getProportionateScreenWidth(12),
                      getProportionateScreenHeight(0),
                    ),
                    padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(0),
                      getProportionateScreenHeight(24),
                      getProportionateScreenWidth(0),
                      getProportionateScreenHeight(24),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/log_out.svg"),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(30),
                          ),
                          child: Text(
                            "Logout",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.normal,
                              fontSize: getProportionateScreenWidth(13),
                              color: Color(0xFF4F4F4F),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
