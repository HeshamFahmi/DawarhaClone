// ignore_for_file: file_names

import 'package:country_code_picker/country_code_picker.dart';
import 'package:dawarha/constants.dart';
import 'package:dawarha/screens/verifications/verificationCode.dart';
import 'package:flutter/material.dart';

class EnterNumberPage extends StatefulWidget {
  const EnterNumberPage({Key? key}) : super(key: key);

  @override
  State<EnterNumberPage> createState() => _EnterNumberPageState();
}

class _EnterNumberPageState extends State<EnterNumberPage> {
  TextEditingController mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: customText("Phone Registration", 20.0, Colors.black),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customSizedBox(0.0, 20.0),
          customTextBold("Enter your phone number", 22.0, Colors.black),
          customText(
              "You may recieve an SMS for verification", 12.0, Colors.grey),
          customSizedBox(0.0, 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: CountryCodePicker(
                  onChanged: print,
                  initialSelection: 'EG',
                  flagDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: customTextField(
                      "Phone number", mobileController, TextInputType.phone))
            ],
          ),
          customSizedBox(0.0, 20.0),
          InkWell(
            onTap: () {
              if (mobileController.text.length < 10) {
                ScaffoldMessenger.of(context).showSnackBar(
                    customSnackbar("Mobile number not valid...", Colors.red));

                return;
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VerificationCode(
                          mobileNumber: mobileController.text.toString(),
                        )),
              );
            },
            child: customButton(
              Colors.green,
              "NEXT",
              double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
