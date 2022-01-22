// ignore_for_file: file_names

import 'package:dawarha/constants.dart';
import 'package:dawarha/screens/verifications/verificationsNumber.dart';
import "package:flutter/material.dart";
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        onBoardingPageView("Recycle Now!",
            "Dawarha app helps you to find the right way to recycle wastes"),
        onBoardingPageView("Collect & Win!",
            "Recycle more & more to get points and use it any time"),
        onBoardingPageView("Search for Machines!",
            "Allow app to access your location to find the nearest recycle machine from you")
      ],
      onDone: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const EnterNumberPage()));
      },
      next: const Icon(Icons.next_plan),
      done: const Text("Yalla Dawarha!",
          style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.green,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
    );
  }
}
