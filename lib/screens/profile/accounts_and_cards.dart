import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/components/buttons/primary.dart';
import 'package:selcapital/components/buttons/primary_block.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/providers/user.dart';
import 'package:selcapital/size_config.dart';

class AccountsAndCardsScreen extends StatefulWidget {
  static String routeName = "/accounts_and_cards";
  @override
  _AccountsAndCardsState createState() => _AccountsAndCardsState();
}

class _AccountsAndCardsState extends State<AccountsAndCardsScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(getProportionateScreenHeight(50)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              unselectedLabelColor: kTextColorGrey,
              labelColor: kTextColorGrey,
              isScrollable: true,
              dragStartBehavior: DragStartBehavior.start,
              indicatorPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10)),
              labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins'),
              tabs: [
                new Tab(
                  text: "Accounts",
                ),
                new Tab(
                  text: "Cards",
                ),
              ],
              controller: _tabController,
              indicatorColor: Color(0xFFF2994A),
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
        ),
        bottomOpacity: 1,
      ),
      body: TabBarView(
        children: [
          Container(
              padding: EdgeInsets.all(24),
              child: ListView(shrinkWrap: true, children: [
                Container(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(16)),
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    border: Border.all(color: kStrokeColorDark),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(24),
                      ),
                      Row(
                        children: [
                          Text(
                            "First Bank",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Color(0xFF2D9CDB)),
                          ),
                          Spacer()
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(16),
                      ),
                      Text("234353312123232",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                              color: Color(0xFF4F4F4F))),
                      SizedBox(
                        height: getProportionateScreenHeight(16),
                      ),
                      Text("Margaret Novakowska",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: Color(0xFF828282))),
                      SizedBox(
                        height: getProportionateScreenHeight(24),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(24),
                ),
              ])),
          Container(
              padding: EdgeInsets.all(24),
              child: ListView(shrinkWrap: true, children: [
                Container(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(32)),
                  decoration: BoxDecoration(
                    color: Color(0xFF3F66F1),
                    border: Border.all(color: kStrokeColorDark),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(24),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            child: Image.asset("assets/images/master_card.png"),
                          ),
                          Spacer()
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(16),
                      ),
                      Text("**** **** ****  1234",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                              color: Colors.white)),
                      SizedBox(
                        height: getProportionateScreenHeight(16),
                      ),
                      Text("02/24",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: Color(0xFFF2C94C))),
                      SizedBox(
                        height: getProportionateScreenHeight(24),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(24),
                ),
              ])),
        ],
        controller: _tabController,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF4EE3E5),
        onPressed: () =>
            Navigator.popAndPushNamed(context, AddAccount.routeName),
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddAccount extends StatefulWidget {
  static String routeName = "/add_accounts";
  @override
  _AddAccountState createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  int y = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.only(top: getProportionateScreenHeight(8)),
              child: Text("Provide account information",
                  style: TextStyle(
                    letterSpacing: 1,
                    color: kTextColorBlue,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  )),
            ),
            SizedBox(
              height: getProportionateScreenHeight(36),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(8)),
              decoration: BoxDecoration(
                border: Border.all(color: kStrokeColorDark),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Bank Name",
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
              child: TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Account Number",
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
              height: getProportionateScreenHeight(250),
            ),
            PrimaryBlockButton(
              text: "Validate",
              press: () => _addProductBottomSheet(context),
            )
          ],
        ),
      ),
    );
  }

  void _addProductBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              height: getProportionateScreenHeight(320),
              //  (MediaQuery.of(context).size.height * 10) - 500,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Consumer<UserModel>(builder: (context, user, child) {
                        return Container(
                          child: Text("${user.user?.profile?.name}",
                              style: TextStyle(
                                letterSpacing: 1,
                                color: kTextColorBlue,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              )),
                        );
                      }),
                      SizedBox(
                        height: getProportionateScreenHeight(4),
                      ),
                      Container(
                        child: Text("Account Name",
                            style: TextStyle(
                              letterSpacing: 1,
                              color: Color(0xFFF2994A),
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            )),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(12),
                      ),
                      IndexedStack(
                        index: y,
                        children: [
                          PrimaryButton(
                            text: "Submit",
                            press: () async {
                              setState(() {
                                y = 1;
                              });
                              // if (_formKey.currentState.validate()) {
                              //   _formKey.currentState.save();
                              //   setState(() {
                              //     y = 2;
                              //   });
                              //   bool validOTP =
                              //       await account.validateBvn(otp, tnx);
                              //   if (validOTP) {
                              Navigator.popAndPushNamed(
                                  context, AccountsAndCardsScreen.routeName);
                              setState(() {
                                y = 0;
                              });
                              //     }
                              //     setState(() {
                              //       y = 1;
                              //     });
                              //   }
                            },
                          ),
                          Center(
                            child: CircularProgressIndicator(
                              value: null,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(4),
                      ),
                      Container(
                        child: Text("Not my account",
                            style: TextStyle(
                              letterSpacing: 1,
                              color: kTextColorGrey,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            )),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
