// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(item, fit: BoxFit.cover, width: 1000.0)),
        ))
    .toList();

List<String> listTitle = [
  "Nestle Pure Life",
  "Redeem at Total",
  "Redeem at Carrefour",
];

class _HomeScreenState extends State<HomeScreen> {
  final Stream<QuerySnapshot> _earthHeroStream =
      FirebaseFirestore.instance.collection('EarthHeros').snapshots();
  final Stream<QuerySnapshot> _competitionsStream =
      FirebaseFirestore.instance.collection('Competitions').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customSizedBox(0.0, MediaQuery.of(context).size.height * 0.05),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText("DAWARHA", 22.0, Colors.blue),
                  customCircleImage(avatarAsset, 40.0, 40.0)
                ],
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
              ),
              items: imageSliders,
            ),
            customSizedBox(0.0, 20.0),
            Container(
              alignment: Alignment.centerLeft,
              child: customTextBold("Earth Heros", 20.0, Colors.black),
            ),
            customSizedBox(0.0, 10.0),
            Container(
              alignment: Alignment.centerLeft,
              height: MediaQuery.of(context).size.height * 0.15,
              width: double.infinity,
              child: StreamBuilder<QuerySnapshot>(
                stream: _earthHeroStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  return ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            customNetworkCircleImage(data['image'], 80.0, 80.0),
                            customSizedBox(0.0, 15.0),
                            customText(data['name'], 15.0, Colors.black)
                          ],
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: customTextBold("Competitions", 20.0, Colors.black),
            ),
            customSizedBox(0.0, 10.0),
            Container(
              alignment: Alignment.centerLeft,
              height: MediaQuery.of(context).size.height * 0.20,
              width: double.infinity,
              child: StreamBuilder<QuerySnapshot>(
                stream: _competitionsStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  return ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            customNetworkCircleImage(
                                data['image'], 150.0, 150.0),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
