import 'package:flutter/material.dart';
import 'package:my_flutter_app/codefactory/ch10_random_dice/screen/home_screen.dart';
import 'package:my_flutter_app/codefactory/ch10_random_dice/screen/root_screen.dart';
import 'package:my_flutter_app/codefactory/ch10_random_dice/const/colors.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      sliderTheme: SliderThemeData(
        thumbColor: primaryColor,
        activeTrackColor: primaryColor,
        inactiveTrackColor: primaryColor.withOpacity(0.3),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColor,
        unselectedItemColor: secondaryColor,
        backgroundColor: backgroundColor
      )
    ),
    home: RootScreen(),
  ));
}
