// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../constants.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          customSizedBox(0.0, MediaQuery.of(context).size.height * 0.05),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.all(20.0),
            child: const Icon(
              Icons.refresh,
              size: 30,
              color: Colors.green,
            ),
          ),
          customCircleImage(logoAsset, 200.0, 250.0),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(20.0), left: Radius.circular(20.0))),
            height: MediaQuery.of(context).size.height * 0.55,
            width: double.infinity,
            padding: const EdgeInsets.all(30.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              customTextBold("Total Balance", 20.0, Colors.lightBlue),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                        text: "0 ",
                        children: [
                          TextSpan(
                              text: "Dawarha Coins",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 13)),
                        ],
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                    textAlign: TextAlign.center,
                  ),
                  customButton(Colors.blue, "Redeem",
                      MediaQuery.of(context).size.width * 0.2)
                ],
              ),
              customSizedBox(0.0, 15.0),
              customTextBold("Transactions", 20.0, Colors.blue),
              customText("Empty", 15.0, Colors.grey)
            ]),
          )
        ],
      ),
    );
  }
}
