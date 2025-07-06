import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ai_assitance/helper/global.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class APIs {
  static Future<String> getAnswer(String question) async {
    try {
      final resBody = {
        "contents": [
          {
            "parts": [
              {"text": question}
            ]
          }
        ]
      };
      final response = await post(
          Uri.parse(
              'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent'),
          headers: {
            "Content-Type": "application/json",
            "X-goog-api-key": apiKey
          },
          body: jsonEncode(resBody));

      final data = jsonDecode(response.body);

      log('gpt response $data');
      return data['candidates'][0]['content']['parts'][0]['text'];
    } catch (e) {
      print(e);
      return 'Something went wrong';
    }
  }
}
