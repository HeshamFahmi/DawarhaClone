// ignore_for_file: avoid_print, file_names

import 'package:dawarha/constants.dart';
import 'package:dawarha/screens/registration/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCode extends StatefulWidget {
  final String? mobileNumber;

  const VerificationCode({Key? key, this.mobileNumber}) : super(key: key);
  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            customSizedBox(0.0, MediaQuery.of(context).size.height * 0.1),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: customTextBold(
                    "Phone Number Verification", 18.0, Colors.black)),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
              child: RichText(
                text: TextSpan(
                    text: "Enter the code sent to ",
                    children: [
                      TextSpan(
                          text: widget.mobileNumber,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                    ],
                    style:
                        const TextStyle(color: Colors.black54, fontSize: 15)),
                textAlign: TextAlign.center,
              ),
            ),
            customSizedBox(0.0, 20.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: PinCodeTextField(
                length: 6,
                obscureText: false,
                appContext: context,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                ),
                animationDuration: const Duration(milliseconds: 300),
                controller: textEditingController,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);
                },
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationScreen()),
                );
              },
              child: customButton(Colors.green, "NEXT", double.infinity),
            ),
          ],
        ),
      ),
    );
  }
}
