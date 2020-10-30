import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:selcapital/providers/options.dart';
import 'package:selcapital/routes.dart';
import 'package:selcapital/screens/splash.dart';
import 'package:selcapital/theme.dart';
import 'package:selcapital/providers/user.dart';
import 'package:selcapital/providers/savings.dart';
import 'package:selcapital/providers/investment.dart';
import 'package:selcapital/providers/accounts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserModel>(
          create: (context) => UserModel(),
        ),
        ChangeNotifierProvider<OptionsModel>(
          create: (context) => OptionsModel(),
        ),
        ChangeNotifierProxyProvider<UserModel, SavingsModel>(
          create: (_) => SavingsModel(),
          update: (_, userModel, savingsModel) =>
              savingsModel..update(userModel),
        ),
        ChangeNotifierProxyProvider<UserModel, InvestmentModel>(
          create: (_) => InvestmentModel(),
          update: (_, userModel, investmentModel) =>
              investmentModel..update(userModel),
        ),
        ChangeNotifierProxyProvider<UserModel, AccountsModel>(
          create: (_) => AccountsModel(),
          update: (_, userModel, accountsModel) =>
              accountsModel..update(userModel),
        ),
      ],
      child: Selcapital(),
    ),
  );
}

class Selcapital extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: routes,
    );
  }
}
