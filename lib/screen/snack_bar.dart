import 'package:flutter/material.dart';

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
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color.alphaBlend(Colors.black, Colors.black))
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(ctx)
                        .showSnackBar(const SnackBar(content: Text("hello")));
                  },
                  child: const Text(
                    "show me",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
    );
  }
}
