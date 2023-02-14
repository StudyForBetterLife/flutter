import 'package:flutter/material.dart';

// https://youtu.be/BWG9XS5ecig
class PushNamed extends StatelessWidget {
  const PushNamed({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const FirstPage(),
        "/a": (context) => const APage(),
        "/b": (context) => const BPage(),
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text("go to the A Page"),
              onPressed: () {
                Navigator.pushNamed(context, "/a");
              },
            ),
            TextButton(
              child: const Text("go to the B Page"),
              onPressed: () {
                Navigator.pushNamed(context, "/b");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class APage extends StatelessWidget {
  const APage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("A Page"),
      ),
      body: const Center(child: Text("A Page")),
    );
  }
}

class BPage extends StatelessWidget {
  const BPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("B Page"),
      ),
      body: const Center(child: Text("B Page")),
    );
  }
}
