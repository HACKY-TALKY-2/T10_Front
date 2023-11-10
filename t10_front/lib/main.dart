import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:t10_front/navigation.dart';
import 'package:t10_front/services/chargeService.dart';
import 'package:t10_front/services/postService.dart';

import 'package:t10_front/pages/alert/ViewAlert.dart';


import 'package:t10_front/pages/home/Home.dart';
import 'package:t10_front/pages/participate/Participate.dart';
import 'package:t10_front/utils/colors.dart';
import 'package:t10_front/pages/charge/ViewChargeHistory.dart';


final ThemeData myTheme = ThemeData(
    textTheme: const TextTheme(
  headline1: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, color: Colors.black),
  headline2: TextStyle(fontSize: 10.0, color: Colors.black),
  headline3: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, color: UtilColor.lightGrey),
  subtitle1:
      TextStyle(fontSize: 10.0, color: UtilColor.lightGrey),
  subtitle2: TextStyle(fontSize: 13.0, color: Colors.black),
));
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => PostService()),
    ChangeNotifierProvider(create: (context) => ChargeService()),
  ], child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Login",
      debugShowCheckedModeBanner: false,
      // routes: namedRoutes,
      // initialRoute: "/ViewMainPage",
      home: Navigation(),
    );
  }
}
