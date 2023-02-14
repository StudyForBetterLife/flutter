import 'package:flutter/material.dart';

// https://youtu.be/8ZpMFUlFcvo
// https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e
class ColumnRowWidget extends StatelessWidget {
  const ColumnRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            verticalDirection: VerticalDirection.up,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.white,
                child: const Text("Container 1"),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: 400,
                height: 100,
                color: Colors.blue,
                child: const Text("Container 2"),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: const Text("Container 3"),
              ),
              Container(
                width: double.infinity,
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
