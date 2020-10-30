import 'package:flutter/material.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/components/buttons/primary.dart';
import 'package:selcapital/components/buttons/secondary.dart';
import 'package:selcapital/screens/onboarding/bvn.dart';
import 'package:selcapital/screens/onboarding/login.dart';
import 'package:selcapital/size_config.dart';

class OnboardingScreen extends StatelessWidget {
  static String routeName = "/onboarding";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          OnboardingBody(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(95)),
            child: Container(
              margin: EdgeInsets.only(top: getProportionateScreenHeight(70)),
              child: Image.asset(
                "assets/images/logo.png",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingBody extends StatefulWidget {
  @override
  _OnboardingBodyState createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  int currentPage = 0;
  List<String> onboardingImages = [
    "assets/images/landing-1.png",
    "assets/images/landing-2.png",
    "assets/images/landing-3.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: onboardingImages.length,
              itemBuilder: (context, index) => BackgroundContent(
                image: onboardingImages[index],
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.fromLTRB(0, getProportionateScreenHeight(235), 0, 0),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingImages.length,
                  (index) => indicator(index: index),
                ),
              ),
            ),
          ),
          Opacity(
            opacity: 0.9,
            child: Container(
              transform: Matrix4.translationValues(
                  0, getProportionateScreenHeight(550), 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(getProportionateScreenHeight(50)),
                  topRight: Radius.circular(getProportionateScreenHeight(50)),
                ),
              ),
            ),
          ),
          Container(
            transform: Matrix4.translationValues(
                1, getProportionateScreenHeight(550), 1),
            child: Column(
              children: [
                PrimaryButton(
                  text: "Get Started",
                  press: () {
                    Navigator.popAndPushNamed(context, BvnValidation.routeName);
                  },
                ),
                SecondaryButton(
                  text: "Sign In",
                  press: () {
                    Navigator.popAndPushNamed(context, LoginScreen.routeName);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer indicator({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: getProportionateScreenWidth(8)),
      height: getProportionateScreenHeight(8),
      width: currentPage == index
          ? getProportionateScreenHeight(8)
          : getProportionateScreenHeight(8),
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(getProportionateScreenHeight(4)),
      ),
    );
  }
}

class BackgroundContent extends StatelessWidget {
  final String image;

  const BackgroundContent({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
