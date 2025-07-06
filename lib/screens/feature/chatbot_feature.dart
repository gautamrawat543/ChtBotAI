import 'package:ai_assitance/controller/chat_controller.dart';
import 'package:ai_assitance/helper/global.dart';
import 'package:ai_assitance/widgets/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBotFeature extends StatefulWidget {
  const ChatBotFeature({super.key});

  @override
  State<ChatBotFeature> createState() => _ChatBotFeatureState();
}

class _ChatBotFeatureState extends State<ChatBotFeature> {
  final _c = ChatController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with AI Assitance'),
      ),
      body: Obx(
        () => ListView(
          physics: BouncingScrollPhysics(),
          controller: _c.scrollC,
          padding:
              EdgeInsets.only(top: mq.height * 0.02, bottom: mq.height * 0.02),
          children: _c.list.map((e) => MessageCard(message: e)).toList(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
              controller: _c.textController,
              textAlign: TextAlign.center,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                hintText: 'Ask me anything',
                hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),
            )),
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundColor: Colors.blue.shade600,
              radius: 24,
              child: IconButton(
                  onPressed: _c.askQuestion,
                  icon: Icon(
                    Icons.rocket_launch_rounded,
                    color: Colors.white,
                    size: 28,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
