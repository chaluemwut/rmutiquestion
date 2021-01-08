import 'dart:async';

import 'package:app/main_screen.dart';
import 'package:flutter/material.dart';
import 'config.dart';

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
    routes: {
      '/MainScreen': (BuildContext context) => MainScreen()
    },
    theme: ThemeData(
        primaryColor: Color(Config.MAIN_COLOR),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(Config.MAIN_COLOR),
          // textTheme: ButtonTextTheme.accent
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData().textTheme.apply(bodyColor: Colors.white),
        )),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScren();
  }
}

class _SplashScren extends State {

  _startTime() async {
    Timer(Duration(seconds: 1),
        () => Navigator.of(context).pushReplacementNamed('/MainScreen'));
  }

  @override
  void initState() {
    _startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Config.MAIN_COLOR),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'RMUTi KKC',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
