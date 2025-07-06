import 'package:ai_assitance/helper/global.dart';
import 'package:ai_assitance/model/message.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return message.msgType == MessageType.user
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  constraints: BoxConstraints(maxWidth: mq.width * 0.6),
                  margin: EdgeInsets.only(
                      bottom: mq.height * 0.02, left: mq.width * 0.02),
                  padding: EdgeInsets.symmetric(
                      vertical: mq.height * 0.01, horizontal: mq.width * 0.02),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black54),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                  ),
                  child: Text(message.msg)),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 18,
                child: Icon(
                  Icons.person,
                  color: Colors.blue.shade600,
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 18,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 24,
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: mq.width * 0.6),
                margin: EdgeInsets.only(
                    bottom: mq.height * 0.02, left: mq.width * 0.02),
                padding: EdgeInsets.symmetric(
                    vertical: mq.height * 0.01, horizontal: mq.width * 0.02),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black54),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: message.msg.trim().isEmpty
                    ? AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Please Wait ..',
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        repeatForever: true,
                      )
                    : Text(message.msg),
              ),
            ],
          );
  }
}
