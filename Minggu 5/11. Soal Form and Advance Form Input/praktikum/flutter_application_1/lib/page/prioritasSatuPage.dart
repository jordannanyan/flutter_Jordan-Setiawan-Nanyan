import 'package:flutter/material.dart';
import 'package:flutter_application_1/style/colors.dart';

class PrioritasSatu extends StatefulWidget {
  const PrioritasSatu({super.key});

  @override
  State<PrioritasSatu> createState() => _PrioritasSatuState();
}

class _PrioritasSatuState extends State<PrioritasSatu> {
  List<Map<String, String>> dataList = [
    {
      "title": "Contacts1",
      "subtitle": "Contacts",
    },
    {
      "title": "Contacts2",
      "subtitle": "Contacts",
    },
    {
      "title": "Contacts3",
      "subtitle": "Contacts",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: const Text(
            "Contacts",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        backgroundColor: purpleColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
                child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: lightgreyColor,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.phone_android,
                        color: Color(0xFF625B71),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Create New Contacts",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ",
                        style: TextStyle(
                          fontSize: 14,
                          color: greyColor,
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(
                      color: greyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  hintText: "Insert your name",
                  hintStyle: TextStyle(
                      color: greyColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  filled: true,
                  fillColor: Color(0xFFE7E0EC),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: greyColor,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Number",
                  labelStyle: TextStyle(
                      color: greyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  hintText: "+62 ....",
                  hintStyle: TextStyle(
                      color: greyColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  filled: true,
                  fillColor: Color(0xFFE7E0EC),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: greyColor,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    print(dataList);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purpleColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                      right: 24,
                      left: 24,
                      top: 10,
                      bottom: 10,
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
