import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyRadioPage(),
    );
  }
}

class MyRadioPage extends StatefulWidget {
  @override
  _MyRadioPageState createState() => _MyRadioPageState();
}

class _MyRadioPageState extends State<MyRadioPage> {
  List<String> options = ["Admin", "User"];
  String selectedValue = ""; // To store the selected radio value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Button Example"),
      ),
      body: Row(
        children: options.map((option) {
          return Row(
            children: <Widget>[
              Radio(
                value: option,
                groupValue: selectedValue,
                onChanged: (newValue) {
                  setState(() {
                    selectedValue = newValue ?? ""; // Update the selected value
                  });
                },
              ),
              Text(option),
            ],
          );
        }).toList(),
      ),
    );
  }
}
