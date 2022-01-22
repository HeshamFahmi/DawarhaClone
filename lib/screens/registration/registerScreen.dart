// ignore_for_file: file_names

import 'package:dawarha/constants.dart';
import 'package:dawarha/screens/home/homePage.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nameController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              customSizedBox(0.0, MediaQuery.of(context).size.height * 0.1),
              customTextBold("Complete Your Profile", 20.0, Colors.black),
              customSizedBox(0.0, 20.0),
              customCircleImage(avatarAsset, 100.0, 150.0),
              customText("Pick Image", 15.0, Colors.black),
              customTextField("Enter first & last name", nameController,
                  TextInputType.name),
              customText("optional", 15.0, Colors.grey),
              customSizedBox(0.0, 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customText("Select Your Gender", 15.0, Colors.grey),
                  Container(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey)),
                    child: DropdownButton<String>(
                      hint: customText("Gender", 15.0, Colors.grey),
                      items: <String>['Male', 'Female', 'Other']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child:
                    customButton(Colors.grey, "Select Date", double.infinity),
              ),
              customText("Selected Date : $selectedDate", 15.0, Colors.grey),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: customButton(Colors.green, "Done", double.infinity),
              ),
              customTermsAndCondition()
            ],
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }
}
