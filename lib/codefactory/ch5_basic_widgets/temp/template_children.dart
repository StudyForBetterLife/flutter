import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            ],
          )
        ),
      ),
    );
  }
}