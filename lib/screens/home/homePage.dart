// ignore_for_file: file_names

import 'package:dawarha/constants.dart';
import 'package:dawarha/screens/home/homeScreen.dart';
import 'package:dawarha/screens/home/mapScreen.dart';
import 'package:dawarha/screens/home/walletScreen.dart';
import 'package:flutter/material.dart';

import 'RanksScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          custombottomNavBar("Home", Icons.home),
          custombottomNavBar("Wallet", Icons.wallet_travel),
          custombottomNavBar("Ranks", Icons.wallet_giftcard),
          custombottomNavBar("Map", Icons.map),
        ],
      ),
      body: Center(child: _pages.elementAt(_selectedIndex)),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    WalletScreen(),
    RanksScreen(),
    MapScreen(),
  ];
}
