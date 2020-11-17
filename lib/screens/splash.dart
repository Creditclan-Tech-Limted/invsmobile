import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/providers/options.dart';
import 'package:selcapital/providers/user.dart';
import 'package:selcapital/size_config.dart';
import 'package:selcapital/screens/onboarding/onboarding.dart';
import 'package:selcapital/screens/bottom_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _loadOptions().then((status) {
      _loginCheck().then((status) {
        if (status) {
          Provider.of<UserModel>(context, listen: false).loadUser();
          Provider.of<OptionsModel>(context, listen: false).loadOptions();
          _navigateToDashboard();
        } else {
          _navigateToOnboarding();
        }
      });
    });
  }

  Future<void> _loadOptions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var _options = Provider.of<OptionsModel>(context, listen: false);

    prefs.getString('gender') ?? await _options.fetchGenders();
    prefs.getString('maritalStatus') ?? await _options.fetchMaritalStatus();
    prefs.getString('educationSectors') ??
        await _options.fetchEducationSectors();
    prefs.getString('occupations') ?? await _options.fetchOccupations();
    prefs.getString('workSectors') ?? await _options.fetchWorkSectors();
    prefs.getString('residenceTypes') ?? await _options.fetchResidenceTypes();
    prefs.getString('states') ?? await _options.fetchStates();
    prefs.getString('banks') ?? await _options.fetchBanks();
  }

  Future<bool> _loginCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('loggedIn') ?? false;
  }

  void _navigateToOnboarding() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => OnboardingScreen()));
  }

  void _navigateToDashboard() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => BottomNavigation()));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: Image.asset(
              "assets/images/logo.png",
              // width: 248,
            ),
          ),
        ),
      ),
    );
  }
}
