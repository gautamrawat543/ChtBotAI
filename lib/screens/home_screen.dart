import 'package:ai_assitance/api/apis.dart';
import 'package:ai_assitance/helper/global.dart';
import 'package:ai_assitance/helper/pref.dart';
import 'package:ai_assitance/model/home_type.dart';
import 'package:ai_assitance/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnboarding = false;
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(appName),
          elevation: 1,
          centerTitle: true,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.blue.shade600, fontSize: 20),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: mq.width * 0.04,
            vertical: mq.height * 0.015,
          ),
          children: HomeType.values
              .map((e) => HomeCard(
                    homeType: e,
                  ))
              .toList(),
        ));
  }
}
