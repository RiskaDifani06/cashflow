import 'package:flutter_cashflow/constant/route_constant.dart';
import 'package:flutter_cashflow/page/expendPage.dart';
import 'package:flutter_cashflow/page/incomePage.dart';
import 'package:flutter_cashflow/page/detailCashflow.dart';
import 'package:flutter_cashflow/page/homePage.dart';
import 'package:flutter_cashflow/page/loginPage.dart';
import 'package:flutter_cashflow/page/settingPage.dart';
import 'package:flutter_cashflow/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: const MyApp()));
}

final routes = {
  loginRoute: (BuildContext context) => LoginPage(),
  homeRoute: (BuildContext context) => HomePage(),
  settingsRoute: (BuildContext context) => SettingsPage(),
  addExpenseRoute: (BuildContext context) => AddExpenditurePage(),
  addIncomeRoute: (BuildContext context) => AddIncomePage(),
  detailCashFlowRoute: (BuildContext context) => DetailCashFlowPage(),
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cashflow App",
      theme: ThemeData(primarySwatch: Colors.amber),
      routes: routes,
    );
  }
}
