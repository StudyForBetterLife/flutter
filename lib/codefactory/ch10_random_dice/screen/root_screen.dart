import 'package:flutter/material.dart';
import 'package:my_flutter_app/codefactory/ch10_random_dice/screen/home_screen.dart';
import 'package:my_flutter_app/codefactory/ch10_random_dice/screen/setting_screen.dart';
import 'dart:math';
import 'package:shake/shake.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

/*
* TickerProviderStateMixin: 애니메이션의 효율을 올려주는 역할을 한다.
* */

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  TabController? controller;
  double threshold = 2.7;
  int number = 1;
  ShakeDetector? shakeDetector;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller!.addListener(tabListener);
    shakeDetector = ShakeDetector.autoStart(
        onPhoneShake: onPhoneShake,
        shakeSlopTimeMS: 100,
        shakeThresholdGravity: threshold);
  }

  tabListener() {
    setState(() {});
  }

  void onPhoneShake() {
    final rand = new Random();
    setState(() {
      number = rand.nextInt(5) + 1;
    });
  }

  @override
  void dispose() {
    controller!.removeListener(tabListener);
    shakeDetector!.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: renderChildren(),
      ),
      bottomNavigationBar: renderBottomNavigation(),
    );
  }

  renderBottomNavigation() {
    return BottomNavigationBar(
        currentIndex: controller!.index,
        onTap: (int index) {
          setState(() {
            controller!.animateTo(index);
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.edgesensor_high_outlined,
              ),
              label: "주사위"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: "설정"),
        ]);
  }

  renderChildren() {
    return [
      HomeScreen(number: number),
      SettingsScreen(threshold: threshold, onThresholdChange: onThresholdChange)
    ];
  }

  void onThresholdChange(double value) {
    setState(() {
      threshold = value;
    });
  }
}
