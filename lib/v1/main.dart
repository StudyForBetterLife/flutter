import 'package:flutter/material.dart';
import 'package:my_flutter_app/v1/screen/column_row_widget.dart';
import 'package:my_flutter_app/v1/screen/grade.dart';
import 'package:my_flutter_app/v1/screen/my_app.dart';
import 'package:my_flutter_app/v1/screen/my_navigator.dart';
import 'package:my_flutter_app/v1/screen/push_named.dart';
import 'package:my_flutter_app/v1/screen/snack_bar.dart';

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
                child: const Text("MyPage"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Grade()));
                },
                child: const Text("/Grade"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MySnackBar()));
                },
                child: const Text("/MySnackBar"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ColumnRowWidget()));
                },
                child: const Text("/ColumnRowWidget"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyNavigator()));
                },
                child: const Text("/MyNavigator"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PushNamed()));
                },
                child: const Text("/PushedName"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
