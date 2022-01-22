import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:introduction_screen/introduction_screen.dart';

String logoAsset = "assets/logo.png";
String avatarAsset = "assets/avatar2.png";

customText(String title, dynamic size, Color color) {
  return Text(
    title,
    style: TextStyle(fontSize: size, color: color),
  );
}

customTextBold(String title, dynamic size, Color color) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Text(
      title,
      style:
          TextStyle(fontSize: size, fontWeight: FontWeight.bold, color: color),
    ),
  );
}

customButton(
  Color color,
  String title,
  dynamic width,
) {
  return InkWell(
    child: Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(15.0),
      alignment: Alignment.center,
      width: width,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: color),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
      ),
    ),
  );
}

const bodyStyle = TextStyle(fontSize: 19.0);

const pageDecoration = PageDecoration(
  titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
  bodyTextStyle: bodyStyle,
  descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
  pageColor: Colors.white,
  imagePadding: EdgeInsets.zero,
);

onBoardingPageView(String title, String body) {
  return PageViewModel(
    title: title,
    body: body,
    image: Image.asset(
      logoAsset,
      height: 200,
    ),
    decoration: pageDecoration,
  );
}

customCircleImage(String path, dynamic widht, dynamic height) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(50.0),
    child: Image.asset(
      path,
      width: widht,
      height: height,
      fit: BoxFit.cover,
    ),
  );
}

customNetworkCircleImage(String path, dynamic widht, dynamic height) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(50.0),
    child: Image.network(
      path,
      width: widht,
      height: height,
      fit: BoxFit.cover,
    ),
  );
}

Widget customTextField(
    String hint, TextEditingController controller, TextInputType inputType) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        labelText: hint,
      ),
    ),
  );
}

customSizedBox(dynamic width, dynamic height) {
  return SizedBox(
    height: height,
    width: width,
  );
}

customSnackbar(String title, Color color) {
  return SnackBar(
    content: Text(title),
    backgroundColor: color,
  );
}

customTermsAndCondition() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
    child: RichText(
      text: const TextSpan(
          text: "By clicking Done, you agree to our ",
          children: [
            TextSpan(
                text: "Terms and Conditions ",
                style: TextStyle(
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
            TextSpan(
                text: "and that you have read our ",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
            TextSpan(
                text: "Privacy Policy",
                style: TextStyle(
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
          ],
          style: TextStyle(color: Colors.black, fontSize: 15)),
      textAlign: TextAlign.center,
    ),
  );
}

custombottomNavBar(String label, IconData icon) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: label,
  );
}

customSpeedDial(String title, Icon icon) {
  return SpeedDialChild(
      child: icon,
      backgroundColor: Colors.green,
      onTap: () {},
      label: title,
      labelStyle: const TextStyle(
          fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16.0),
      labelBackgroundColor: Colors.green);
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
