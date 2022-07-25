// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import '../../../Style/Colors.dart';
import 'on_board_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return OnBoardScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Constants.primaryAppColor,
        child: Center(
            child: Image.asset("assets/Logo.png", color: Constants.white)),
      ),
    );
  }
}
