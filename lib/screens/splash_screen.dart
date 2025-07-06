import 'package:ai_assitance/helper/global.dart';
import 'package:ai_assitance/helper/pref.dart';
import 'package:ai_assitance/screens/home_screen.dart';
import 'package:ai_assitance/screens/onboarding_screen.dart';
import 'package:ai_assitance/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (context) =>
      //         Pref.showOnboarding ? OnBoarding() : HomeScreen()));

      Get.off(() => Pref.showOnboarding ? OnBoarding() : HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Spacer(),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: mq.width * 0.5,
                ),
              ),
            ),
            Spacer(),
            CustomLoading(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
