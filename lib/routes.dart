import 'package:flutter/widgets.dart';
import 'package:selcapital/screens/onboarding/bvn.dart';
import 'package:selcapital/screens/onboarding/forgot_password.dart';
import 'package:selcapital/screens/onboarding/otp.dart';
import 'package:selcapital/screens/profile/account.dart';
import 'package:selcapital/screens/splash.dart';
import 'package:selcapital/screens/bottom_nav.dart';
import 'package:selcapital/screens/plans/successful.dart';
import 'package:selcapital/screens/onboarding/login.dart';
import 'package:selcapital/screens/onboarding/onboarding.dart';
import 'package:selcapital/screens/plans/add_plan.dart';
import 'package:selcapital/screens/investment/investment_detail.dart';
import 'package:selcapital/screens/investment/investments.dart';
import 'package:selcapital/screens/savings/savings.dart';
import 'package:selcapital/screens/savings/savings_detail.dart';
import 'package:selcapital/screens/profile/accounts_and_cards.dart';
import 'package:selcapital/screens/profile/change_password.dart';
import 'package:selcapital/screens/profile/edit_profile.dart';
import 'package:selcapital/screens/onboarding/signup.dart';
import 'package:selcapital/screens/plans/vest_later/product_detail.dart';
import 'package:selcapital/screens/plans/vest_later/product_detail_more.dart';
import 'package:selcapital/screens/plans/vest_later/vest_later.dart';
import 'package:selcapital/screens/plans/vest_small/amount.dart';
import 'package:selcapital/screens/plans/vest_small/automate_savings.dart';
import 'package:selcapital/screens/plans/vest_small/frequency.dart';
import 'package:selcapital/screens/plans/vest_small/goal_target.dart';
import 'package:selcapital/screens/plans/vest_small/goal_title.dart';
import 'package:selcapital/screens/plans/vest_small/start_date.dart';
import 'package:selcapital/screens/plans/vest_small/tenure.dart';
import 'package:selcapital/screens/plans/vest_small/vest_small.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  OnboardingScreen.routeName: (context) => OnboardingScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  BottomNavigation.routeName: (context) => BottomNavigation(),
  AddPlanScreen.routeName: (context) => AddPlanScreen(),
  InvestmentsScreen.routeName: (context) => InvestmentsScreen(),
  SavingsScreen.routeName: (context) => SavingsScreen(),
  VestLaterScreen.routeName: (context) => VestLaterScreen(),
  ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
  ProductDetailMore.routeName: (context) => ProductDetailMore(),
  SuccesfulScreen.routeName: (context) => SuccesfulScreen(),
  VestSmallScreen.routeName: (cotext) => VestSmallScreen(),
  GoalTitleScreen.routeName: (context) => GoalTitleScreen(),
  GoalTargetScreen.routeName: (context) => GoalTargetScreen(),
  AutomateSavingsScreen.routeName: (context) => AutomateSavingsScreen(),
  FrequencyScreen.routeName: (context) => FrequencyScreen(),
  AmountScreen.routeName: (context) => AmountScreen(),
  StartDateScreen.routeName: (context) => StartDateScreen(),
  TenureScreen.routeName: (context) => TenureScreen(),
  EditProfileScreen.routeName: (context) => EditProfileScreen(),
  ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),
  AccountsAndCardsScreen.routeName: (context) => AccountsAndCardsScreen(),
  SavingsDetailScreen.routeName: (context) => SavingsDetailScreen(),
  InvestmentDetailScreen.routeName: (context) => InvestmentDetailScreen(),
  BvnValidation.routeName: (context) => BvnValidation(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  PasswordValidation.routeName: (context) => PasswordValidation(),
  OTPscreen.routeName: (context) => OTPscreen(),
  AddAccount.routeName: (context) => AddAccount(),
  AccountScreen.routeName: (context) => AccountScreen(),
};
