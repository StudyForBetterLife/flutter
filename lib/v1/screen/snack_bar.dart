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
                        )),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => const SecondPage()));
                        },
                        child: const Text("Go to the second page"))
                  ],
                ),
              )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.thumb_up),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text("like a new snackbar"),
            duration: const Duration(seconds: 5),
            action: SnackBarAction(
              label: "Undo",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const ThirdPage()));
              },
            ),
          ));
        },
      ),
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

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: const Center(
        child: Text(
          "좋아요가 추가되었습니다",
          style: TextStyle(fontSize: 20.0, color: Colors.red),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Third Page"),
      ),
      body: Builder(
        builder: (context) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "좋아요를 취소 하시겠습니까?",
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("좋아요가 취소되었습니다"),
                      duration: Duration(seconds: 3),
                    ));
                  },
                  child: const Text("취소하기"))
            ],
          ));
        },
      ),
    ));
  }
}
