import 'package:flutter/material.dart';
import 'package:my_flutter_app/screen/grade.dart';
import 'package:my_flutter_app/screen/my_app.dart';
import 'package:my_flutter_app/screen/snack_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyPage()));
                },
                child: const Text("/my-page"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Grade()));
                },
                child: const Text("/grade"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MySnackBar()));
                },
                child: const Text("/snack-bar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
