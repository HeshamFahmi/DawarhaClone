// ignore_for_file: file_names

import 'dart:async';

import 'package:dawarha/constants.dart';
import 'package:dawarha/screens/onBoarding/onBoardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnBoardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            HexColor("#c2e59c"),
            HexColor("#64b3f4"),
          ],
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                logoAsset,
                width: 200,
                height: 200,
              ),
              customSizedBox(0.0, MediaQuery.of(context).size.height * 0.4),
              Container(
                alignment: Alignment.bottomCenter,
                child: customTextBold("     From\nDAWARHA", 17.0, Colors.white),
              )
            ],
          )),
    );
  }
}
