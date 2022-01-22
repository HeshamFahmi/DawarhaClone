// ignore_for_file: file_names

import 'package:dawarha/constants.dart';
import 'package:flutter/material.dart';

class RanksScreen extends StatefulWidget {
  const RanksScreen({Key? key}) : super(key: key);

  @override
  _RanksScreenState createState() => _RanksScreenState();
}

class _RanksScreenState extends State<RanksScreen> {
  List<String> competitionTitle = ["Nestle HQ", "Carrfour HQ"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        customSizedBox(0.0, MediaQuery.of(context).size.height * 0.1),
        customTextBold("Join a Competition!", 20.0, Colors.black),
        customText("Recycle & Win", 15.0, Colors.grey),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: competitionTitle.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => Column(
              children: [
                Card(
                  child: Row(
                    children: [
                      customCircleImage(logoAsset, 100.0, 100.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customTextBold(
                              competitionTitle[index], 14.0, Colors.black),
                          customText("48/100", 12.0, Colors.grey),
                          customText("Competition Ends in \n10Days & 00.20.52H",
                              12.0, Colors.grey)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const Spacer(),
        Container(
          alignment: Alignment.bottomRight,
          child: customCircleImage(
              avatarAsset,
              MediaQuery.of(context).size.width * 0.4,
              MediaQuery.of(context).size.height * 0.3),
        )
      ],
    ));
  }
}
