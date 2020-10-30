import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:selcapital/components/buttons/primary_block.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/providers/options.dart';
import 'package:selcapital/screens/bottom_nav.dart';
import 'package:selcapital/size_config.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/providers/user.dart';

class EditProfileScreen extends StatefulWidget {
  static String routeName = "/edit_profile";
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfileScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  TabController _tabController;
  int _tabState = 0;
  int s = 1;

  DateTime selectedDate = DateTime.now();

  int _st = 0;
  String text;

  var formatter = new DateFormat('yyyy-MM-dd');

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  TextEditingController _name;
  TextEditingController _email;
  TextEditingController _phone;
  String _gender = '2';
  String _maritalStatus;
  String _levelOfEducation;
  String _employmentStatus;
  String _workSector;
  TextEditingController _employerName;
  TextEditingController _workStartDate;
  TextEditingController _monthlyIncome;
  String _typeOfResident;
  TextEditingController _address;
  String _state;
  String _lga;
  TextEditingController _residentYears;
  TextEditingController _nokName;
  TextEditingController _nokEmail;
  TextEditingController _nokPhone;
  TextEditingController _nokRelationship;

  @override
  void initState() {
    _tabController = new TabController(
      length: 4,
      vsync: this,
      initialIndex: _tabState,
    );
    final user = context.read<UserModel>();

    super.initState();
    _name = TextEditingController(text: user.user?.profile?.name);
    _email = TextEditingController(text: user.user?.profile?.email);
    _phone = TextEditingController(text: user.user?.profile?.phone);
    // _gender = user.user?.profile?.gender;
    // _maritalStatus = user.user?.profile?.maritalStatus;
    // _levelOfEducation = user.user?.work['educational_qualification'];
    // _employmentStatus = user.user?.work['occupation_id'];
    // _workSector = user.user?.work['work_sector'];
    _employerName =
        TextEditingController(text: user.user?.work['company_name']);
    _workStartDate =
        TextEditingController(text: user.user?.work['work_start_date']);
    _monthlyIncome =
        TextEditingController(text: user.user?.work['net_monthly_income']);
    // _typeOfResident = user.user?.residence['nature_of_accomodation'];
    _address =
        TextEditingController(text: user.user?.residence['home_address']);
    // _state = user.user?.residence['home_state'];
    // _lga = user.user?.residence['home_lga'];
    _residentYears =
        TextEditingController(text: user.user?.residence['resident_years']);
    _nokName = TextEditingController(text: user.user?.nextOfKin['nok_name']);
    _nokEmail = TextEditingController(text: user.user?.nextOfKin['nok_email']);
    _nokPhone = TextEditingController(text: user.user?.nextOfKin['nok_phone']);
    _nokRelationship =
        TextEditingController(text: user.user?.nextOfKin['nok_relationship']);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    _employerName.dispose();
    _workStartDate.dispose();
    _monthlyIncome.dispose();
    _address.dispose();
    _residentYears.dispose();
    _nokName.dispose();
    _nokEmail.dispose();
    _nokPhone.dispose();
    _nokRelationship.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (_tabState) {
      case 0:
        _tabController.index = 0;
        break;
      case 1:
        _tabController.index = 1;
        break;
      case 2:
        _tabController.index = 2;

        break;
      case 3:
        _tabController.index = 3;

        break;
    }

    switch (_st) {
      case 0:
        text = "Start Date";
        break;
      case 1:
        text = ("${selectedDate.toLocal()}".split(' ')[0]);

        break;
    }
    return Consumer<OptionsModel>(
      builder: (context, options, child) {
        return Consumer<UserModel>(
          builder: (context, user, child) {
            return new Scaffold(
              appBar: new AppBar(
                title: new Text("Back"),
                automaticallyImplyLeading: true,
                bottom: PreferredSize(
                  preferredSize:
                      Size.fromHeight(getProportionateScreenHeight(50)),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      unselectedLabelColor: kTextColorGrey,
                      labelColor: kTextColorGrey,
                      isScrollable: true,
                      indicatorPadding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(10)),
                      labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                      tabs: [
                        new Tab(
                          text: "Personal Information",
                        ),
                        new Tab(
                          text: "Education & Employment",
                        ),
                        new Tab(
                          text: "Residence",
                        ),
                        new Tab(
                          text: "Next of kin",
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
              body: Form(
                key: _formKey,
                child: TabBarView(
                  children: [
                    Container(
                      padding: EdgeInsets.all(24),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            height: 50,
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(8)),
                            decoration: BoxDecoration(
                              border: Border.all(color: kStrokeColorDark),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              enabled: false,
                              keyboardType: TextInputType.name,
                              controller: _name,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Full Name",
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
                              enabled: false,
                              keyboardType: TextInputType.name,
                              controller: _email,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Email Address",
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
                              enabled: false,
                              keyboardType: TextInputType.name,
                              controller: _phone,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Phone",
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
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(8)),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: kStrokeColorDark)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text('Choose Gender',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                      color: kTextColorGrey,
                                    )),
                                isExpanded: true,
                                value: _gender,
                                onChanged: (newValue) {
                                  setState(() {
                                    _gender = newValue;
                                  });
                                },
                                items: options.gender.map((option) {
                                  return DropdownMenuItem(
                                    child: Text(option['name'],
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins",
                                          color: kTextColorGrey,
                                        )),
                                    value: option['id'],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(24),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(8)),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: kStrokeColorDark)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text('Marital Status',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                      color: kTextColorGrey,
                                    )),
                                isExpanded: true,
                                value: _maritalStatus,
                                onChanged: (newValue) {
                                  setState(() {
                                    _maritalStatus = newValue;
                                  });
                                },
                                items: options.maritalStatus.map((option) {
                                  return DropdownMenuItem(
                                    child: Text(option['name'],
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins",
                                          color: kTextColorGrey,
                                        )),
                                    value: option['id'],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(100),
                          ),
                          PrimaryBlockButton(
                              text: "Next",
                              press: () {
                                setState(() {
                                  _tabState = 1;
                                });
                              })
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(24),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(8)),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: kStrokeColorDark)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text('Level of Education',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                      color: kTextColorGrey,
                                    )),
                                isExpanded: true,
                                value: _levelOfEducation,
                                onChanged: (newValue) {
                                  setState(() {
                                    _levelOfEducation = newValue;
                                  });
                                },
                                items: options.educationSectors.map((option) {
                                  return DropdownMenuItem(
                                    child: Text(option['name'],
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins",
                                          color: kTextColorGrey,
                                        )),
                                    value: option['id'],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(24),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(8)),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: kStrokeColorDark)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text('Employment Status',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                      color: kTextColorGrey,
                                    )),
                                isExpanded: true,
                                value: _employmentStatus,
                                onChanged: (newValue) {
                                  setState(() {
                                    _employmentStatus = newValue;
                                  });
                                },
                                items: options.occupations.map((option) {
                                  return DropdownMenuItem(
                                    child: Text(option['name'],
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins",
                                          color: kTextColorGrey,
                                        )),
                                    value: option['id'],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(24),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(8)),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: kStrokeColorDark)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text('Work Sector',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                      color: kTextColorGrey,
                                    )),
                                isExpanded: true,
                                value: _workSector,
                                onChanged: (newValue) {
                                  setState(() {
                                    _workSector = newValue;
                                  });
                                },
                                items: options.workSectors.map((option) {
                                  return DropdownMenuItem(
                                    child: Text(option['name'],
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins",
                                          color: kTextColorGrey,
                                        )),
                                    value: option['id'],
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
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller: _employerName,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Employer Name",
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
                          // Container(
                          //   height: 50,
                          //   decoration: BoxDecoration(
                          //     border: Border.all(color: kStrokeColorDark),
                          //     borderRadius: BorderRadius.circular(5),
                          //   ),
                          //   margin: EdgeInsets.fromLTRB(
                          //       0, 0, 0, getProportionateScreenHeight(24)),
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: getProportionateScreenWidth(12)),
                          //   alignment: Alignment.centerLeft,
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         "$text",
                          //         style: TextStyle(
                          //           fontSize: 15,
                          //           fontWeight: FontWeight.bold,
                          //           fontFamily: "Poppins",
                          //           color: kTextColorGrey,
                          //         ),
                          //       ),
                          //       GestureDetector(
                          //           onTap: () async {
                          //             setState(() {
                          //               _st = 1;
                          //             });
                          //             _selectDate(context);
                          //           },
                          //           child: SvgPicture.asset(
                          //               "assets/icons/calendar.svg"))
                          //     ],
                          //   ),
                          // ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(8)),
                            decoration: BoxDecoration(
                              border: Border.all(color: kStrokeColorDark),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller: _workStartDate,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Start date",
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins",
                                  color: kTextColorGrey,
                                ),
                              ),
                            ),
                          ),
                          //up to this point
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
                              keyboardType: TextInputType.name,
                              controller: _monthlyIncome,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Monthly Income",
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
                            height: getProportionateScreenHeight(40),
                          ),
                          PrimaryBlockButton(
                              text: "Next",
                              press: () {
                                setState(() {
                                  _tabState = 2;
                                });
                              })
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(24),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(8)),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: kStrokeColorDark)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text('Type of Residence',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                      color: kTextColorGrey,
                                    )),
                                isExpanded: true,
                                value: _typeOfResident,
                                onChanged: (newValue) {
                                  setState(() {
                                    _typeOfResident = newValue;
                                  });
                                },
                                items: options.residenceTypes.map((option) {
                                  return DropdownMenuItem(
                                    child: Text(option['name'],
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins",
                                          color: kTextColorGrey,
                                        )),
                                    value: option['id'],
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
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller: _address,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Your Current Address",
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
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(8)),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: kStrokeColorDark)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text(
                                  'State',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins",
                                    color: kTextColorGrey,
                                  ),
                                ),
                                isExpanded: true,
                                value: _state,
                                onChanged: (newValue) {
                                  setState(() {
                                    _state = newValue;
                                  });
                                },
                                items: options.states.map((option) {
                                  return DropdownMenuItem(
                                    child: Text(option['name'],
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins",
                                          color: kTextColorGrey,
                                        )),
                                    value: option['id'],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(24),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(8)),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: kStrokeColorDark)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text(
                                  'Local Government Area',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins",
                                    color: kTextColorGrey,
                                  ),
                                ),
                                isExpanded: true,
                                value: _lga,
                                onChanged: (newValue) {
                                  setState(() {
                                    _lga = newValue;
                                  });
                                },
                                items: options.lgas.map((option) {
                                  return DropdownMenuItem(
                                    child: Text(option['name'],
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins",
                                          color: kTextColorGrey,
                                        )),
                                    value: option['id'],
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
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller: _residentYears,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "How long have you lived there?",
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
                            height: getProportionateScreenHeight(100),
                          ),
                          PrimaryBlockButton(
                              text: "Next",
                              press: () {
                                setState(() {
                                  _tabState = 3;
                                });
                              })
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(24),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            height: 50,
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(8)),
                            decoration: BoxDecoration(
                              border: Border.all(color: kStrokeColorDark),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller: _nokName,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Full Name",
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
                              keyboardType: TextInputType.name,
                              controller: _nokEmail,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Email Address",
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
                              keyboardType: TextInputType.name,
                              controller: _nokPhone,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Phone",
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
                              keyboardType: TextInputType.name,
                              controller: _nokRelationship,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Relationship",
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins",
                                  color: kTextColorGrey,
                                ),
                              ),
                            ),
                          ),
                          //up to this point
                          SizedBox(
                            height: getProportionateScreenHeight(100),
                          ),
                          IndexedStack(
                            index: s,
                            children: [
                              Center(
                                child: CircularProgressIndicator(
                                  value: null,
                                ),
                              ),
                              PrimaryBlockButton(
                                text: "Save",
                                press: () async {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    setState(() {
                                      s = 0;
                                    });
                                    bool isSaved = await user.editProfile(
                                      _name.text,
                                      _email.text,
                                      _phone.text,
                                      _gender,
                                      _maritalStatus,
                                      _levelOfEducation,
                                      _employmentStatus,
                                      _workSector,
                                      _employerName.text,
                                      _workStartDate.text,
                                      _monthlyIncome.text,
                                      _typeOfResident,
                                      _address.text,
                                      _state,
                                      _lga,
                                      _residentYears.text,
                                      _nokName.text,
                                      _nokEmail.text,
                                      _nokPhone.text,
                                      _nokRelationship.text,
                                    );
                                    if (isSaved) {
                                      Navigator.popAndPushNamed(
                                          context, BottomNavigation.routeName);
                                    }
                                    setState(() {
                                      s = 1;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                  controller: _tabController,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
