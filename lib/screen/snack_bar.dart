import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MySnackBar extends StatelessWidget {
  const MySnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snack Bar"),
        centerTitle: true,
      ),
      body: Builder(
          builder: (ctx) => Center(
                child: Column(
                  children: [
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.alphaBlend(Colors.black, Colors.black))),
                      onPressed: () {
                        ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
                            content: Text(
                          "hello",
                          textAlign: TextAlign.center,
                        )));
                      },
                      child: const Text(
                        "show me",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          flutterToast();
                        },
                        child: const Text(
                          "Toast",
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
              )),
    );
  }
}

void flutterToast() {
  Fluttertoast.showToast(
      msg: "Flutter",
      gravity: ToastGravity.BOTTOM,
      webPosition: "center",
      backgroundColor: Colors.redAccent,
      fontSize: 20.0,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}
