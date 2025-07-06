import 'package:ai_assitance/api/apis.dart';
import 'package:ai_assitance/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final textController = TextEditingController();

  final scrollC = ScrollController();

  final list = <Message>[
    Message(msg: 'Hi, How can I help you?', msgType: MessageType.bot),
  ].obs;

  void askQuestion() async {
    if (textController.text.trim().isNotEmpty) {
      list.add(Message(msg: textController.text, msgType: MessageType.user));
      list.add(Message(msg: '', msgType: MessageType.bot));
      _scrollToBottom();
      final res = await APIs.getAnswer(textController.text);
      list.removeLast();
      list.add(Message(msg: res, msgType: MessageType.bot));
      _scrollToBottom();

      textController.clear();
    }
  }

  void _scrollToBottom() {
    scrollC.animateTo(scrollC.position.maxScrollExtent,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }
}
