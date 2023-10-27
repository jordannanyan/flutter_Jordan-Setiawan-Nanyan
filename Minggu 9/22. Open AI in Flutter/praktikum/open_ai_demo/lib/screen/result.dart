import 'package:flutter/material.dart';
import 'package:open_ai_demo/models/open_ai.dart';

class ResultScreen extends StatelessWidget {
  final GptData gptResponseData;
  const ResultScreen({super.key, required this.gptResponseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rekomendasi"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Rekomendasi HP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              gptResponseData.choices[0].text,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
