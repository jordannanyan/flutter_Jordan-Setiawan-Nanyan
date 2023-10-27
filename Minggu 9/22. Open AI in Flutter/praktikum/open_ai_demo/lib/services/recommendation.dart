import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:open_ai_demo/constants/open_ai.dart';
import 'package:open_ai_demo/models/open_ai.dart';
import 'package:http/http.dart' as http;

class RecommendationService {
  static Future<GptData> getRecommendations({
    required String harga,
    required String kamera,
    required String penyimpanan,
  }) async {
    late GptData gptData = GptData(
      id: "",
      object: "",
      model: "",
      created: 0,
      choices: [],
      usage: Usage(promptTokens: 0, completionTokens: 0, totalTokens: 0),
    );
    try {
      var url = Uri.parse('https://api.openai.com/v1/completions');

      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey'
      };

      final formatCurrency = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'IDR',
        decimalDigits: 0,
      );

      String hargaHp = formatCurrency.format(int.parse(harga));

      String promptData =
          "You are a phone expert. Please give me a phone recommendation where the cost is $hargaHp and it has $kamera MP camera, with the interal storage of $penyimpanan GB";

      final data = jsonEncode({
        "model": "text-davinci-003",
        "prompt": promptData,
        "temperature": 0.4,
        "max_tokens": 64,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      });

      var response = await http.post(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        gptData = gptDataFromJson(response.body);
      }
    } catch (e) {
      throw Exception('Request Gagal di Kirim');
    }

    return gptData;
  }
}
