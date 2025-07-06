import 'dart:ui';

import 'package:ai_assitance/screens/feature/chatbot_feature.dart';
import 'package:ai_assitance/screens/feature/translate_feature.dart';
import 'package:get/get.dart';

enum HomeType { aiChatBot, aiTranslator }

extension MyHomeType on HomeType {
  String get title => switch (this) {
        HomeType.aiChatBot => 'AI ChatBot',
        HomeType.aiTranslator => 'AI Language Translator'
      };

  String get lottie => switch (this) {
        HomeType.aiChatBot => 'assets/lottie/ai_hand_waving.json',
        HomeType.aiTranslator => 'assets/lottie/ai_ask_me.json'
      };

  VoidCallback get onTap => switch (this) {
        HomeType.aiChatBot => () => Get.to(() => ChatBotFeature()),
        HomeType.aiTranslator => () => Get.to(() => TranslateFeature())
      };
}
