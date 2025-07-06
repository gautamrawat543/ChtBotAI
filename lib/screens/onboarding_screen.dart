import 'package:ai_assitance/helper/global.dart';
import 'package:ai_assitance/model/onboard.dart';
import 'package:ai_assitance/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    final list = [
      Onboard(
          title: 'Ask me anything',
          subtitle:
              'I can be Your AI Assistant, Ask me anything and I will help',
          lottie: 'assets/lottie/ai_ask_me.json'),
      Onboard(
          title: 'Imagination to Reality',
          subtitle: 'Just imagine anything and I will make it come true',
          lottie: 'assets/lottie/ai_play.json'),
    ];
    return Scaffold(
        body: PageView.builder(
      controller: controller,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Lottie.asset(
              list[index].lottie,
              height: mq.height * 0.6,
            ),
            Text(
              list[index].title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              list[index].subtitle,
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            Spacer(),
            Wrap(
              spacing: 10,
              children: List.generate(
                  list.length,
                  (i) => Container(
                        width: i == index ? 20 : 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: i == index ? Colors.blue : Colors.grey,
                            shape: BoxShape.circle),
                      )),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.blue.shade600,
              ),
              onPressed: () {
                if (index == list.length - 1) {
                      Get.off(() => HomeScreen());
                  return;
                } else {
                  controller.nextPage(
                      duration: Duration(milliseconds: 600),
                      curve: Curves.easeIn);
                }
              },
              child: Text(
                index == list.length - 1 ? 'Finish' : 'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        );
      },
    ));
  }
}
