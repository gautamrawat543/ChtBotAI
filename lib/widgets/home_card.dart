import 'package:ai_assitance/helper/global.dart';
import 'package:ai_assitance/model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, required this.homeType});

  final HomeType homeType;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        margin: EdgeInsets.only(bottom: mq.height * 0.02),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.blue.withOpacity(0.4),
        child: InkWell(
          onTap: homeType.onTap,
          borderRadius: BorderRadius.circular(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Lottie.asset(homeType.lottie, width: mq.width * 0.35),
              Text(
                homeType.title,
                style: TextStyle(fontSize: 14),
              ),
              Spacer(),
            ],
          ),
        )).animate().fade(duration: 2.seconds, curve: Curves.easeIn);
  }
}
