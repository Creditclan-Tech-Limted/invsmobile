import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/components/buttons/primary.dart';
import 'package:selcapital/components/buttons/primary_block.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/providers/user.dart';
import 'package:selcapital/screens/profile/web_view.dart';
import 'package:selcapital/size_config.dart';
import 'package:selcapital/providers/accounts.dart';

class AccountsAndCardsScreen extends StatefulWidget {
  static String routeName = "/accounts_and_cards";
  @override
  _AccountsAndCardsState createState() => _AccountsAndCardsState();
}

class _AccountsAndCardsState extends State<AccountsAndCardsScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int initialIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController =
        new TabController(length: 2, vsync: this, initialIndex: initialIndex);

    Provider.of<AccountsModel>(context, listen: false).fetchBanks();
    Provider.of<AccountsModel>(context, listen: false).fetchCards();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountsModel>(
      builder: (context, accounts, child) {
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
                child: ListView(
                  shrinkWrap: true,
                  children: accounts.banks
                      .map(
                        (bank) => Container(
                          margin: EdgeInsets.only(
                              bottom: getProportionateScreenHeight(24)),
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(16)),
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
                                    bank['bank_name'],
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
                              Text(bank['account_number'],
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF4F4F4F))),
                              SizedBox(
                                height: getProportionateScreenHeight(16),
                              ),
                              Text(bank['account_name'],
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
                      )
                      .toList(),
                ),
              ),
              Container(
                padding: EdgeInsets.all(24),
                child: ListView(
                  shrinkWrap: true,
                  children: accounts.cards
                      .map(
                        (card) => Container(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(32)),
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
                                    child: Image.asset(
                                        "assets/images/master_card.png"),
                                  ),
                                  Spacer()
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(16),
                              ),
                              Text("**** **** **** ${card['LAST_FOUR_DIGITS']}",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins',
                                      color: Colors.white)),
                              SizedBox(
                                height: getProportionateScreenHeight(16),
                              ),
                              Text('${card['EXP_MONTH']}/${card['EXP_YEAR']}',
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
                      )
                      .toList(),
                ),
              ),
            ],
            controller: _tabController,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xFF4EE3E5),
            onPressed: () {
              if (_tabController.index == 0) {
                Navigator.pushNamed(context, AddAccount.routeName);
              } else if (_tabController.index == 1) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => AddCard()));
              }
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class AddAccount extends StatefulWidget {
  static String routeName = "/add_accounts";
  @override
  _AddAccountState createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  int s = 1;
  int y = 0;

  AccountsModel accounts;
  List banksList;

  String _bankCode;

  TextEditingController _accountNumber = TextEditingController();

  @override
  void initState() {
    super.initState();

    accounts = context.read<AccountsModel>();

    banksList = accounts.banksList;
    if (banksList.singleWhere((element) => element['bank_code'] == '0',
            orElse: () => null) ==
        null) {
      banksList.add({'bank_code': '0', 'bank_name': 'Bank Name'});
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _accountNumber.dispose();

    super.dispose();
  }

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
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(8)),
              height: 50,
              decoration:
                  BoxDecoration(border: Border.all(color: kStrokeColorDark)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: Text('Bank Name',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        color: kTextColorGrey,
                      )),
                  isExpanded: true,
                  value: _bankCode,
                  onChanged: (newValue) {
                    setState(() {
                      _bankCode = newValue;
                    });
                  },
                  items: banksList.map((option) {
                    return DropdownMenuItem(
                      child: Text(
                          option['bank_name'] != null
                              ? '${option['bank_name']} - ${option['bank_code']} - ${option['bank_id']}'
                              : '',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            color: kTextColorGrey,
                          )),
                      value: option['bank_code'],
                    );
                  }).toList(),
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
                controller: _accountNumber,
                keyboardType: TextInputType.number,
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
                    text: "Validate",
                    press: () async {
                      setState(() {
                        s = 0;
                      });
                      bool isValid = await accounts.resolveBank(
                          _accountNumber.text, _bankCode);
                      if (isValid) {
                        _addProductBottomSheet(
                          context,
                          accounts,
                          accounts.accountHolder.name,
                          accounts.accountHolder.account,
                          _bankCode,
                          y,
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: "Invalid account number!",
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

  void _addProductBottomSheet(
    context,
    AccountsModel accounts,
    String name,
    String account,
    String bank,
    int y,
  ) {
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
                          child: Center(
                            child: Text(
                              name,
                              style: TextStyle(
                                letterSpacing: 1,
                                color: kTextColorBlue,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        );
                      }),
                      SizedBox(
                        height: getProportionateScreenHeight(4),
                      ),
                      Container(
                        child: Text(
                          "Account Name",
                          style: TextStyle(
                            letterSpacing: 1,
                            color: Color(0xFFF2994A),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
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
                              bool isValid =
                                  await accounts.addBank(name, account, bank);
                              if (isValid) {
                                Navigator.popAndPushNamed(
                                    context, AccountsAndCardsScreen.routeName);
                              }
                              setState(() {
                                y = 0;
                              });
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
                      // Container(
                      //   child: Text("Not my account",
                      //       style: TextStyle(
                      //         letterSpacing: 1,
                      //         color: kTextColorGrey,
                      //         fontFamily: "Poppins",
                      //         fontWeight: FontWeight.w500,
                      //         fontSize: 17,
                      //       )),
                      // ),
                    ],
                  ),
                ),
              ));
        });
  }
}
