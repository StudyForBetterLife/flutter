import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text("click"),
        ),
        body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(foregroundColor: Colors.red),
                    child: Text("text button")),
                OutlinedButton(
                    onPressed: () {},
                    style:
                        OutlinedButton.styleFrom(foregroundColor: Colors.red),
                    child: Text("outlined button")),
                ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Text("elevated button")),
                IconButton(onPressed: () {}, icon: Icon(Icons.home)),
                GestureDetector(
                  onTap: () {
                    print("on tap");
                  },
                  onDoubleTap: () {
                    print("on double tap");
                  },
                  onLongPress: () {
                    print("on long press");
                  },
                  // 제스쳐를 적용할 위젯을 child 위젯에 등록한다.
                  child: Container(
                    decoration: BoxDecoration(color: Colors.red),
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
