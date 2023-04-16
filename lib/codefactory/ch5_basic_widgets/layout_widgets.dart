import 'package:flutter/material.dart';

void main() {
  runApp(StackWidget());
}

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start, // row의 주축(가로) 정렬 속성 지정
            crossAxisAlignment: CrossAxisAlignment.center, // row의 반대축(세로) 정렬 속성 지정

            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.red,
              ),

              const SizedBox(width: 12,), // 공백을 생성할 때 주로 SizedBox를 활용
              Container(
                height: 50,
                width: 50,
                color: Colors.green,
              ),

              const SizedBox(width: 12,),
              Container(
                height: 50,
                width: 50,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // column의 주축(세로) 정렬 속성 지정
            crossAxisAlignment: CrossAxisAlignment.center, // column의 반대축(가로) 정렬 속성 지정

            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.red,
              ),

              const SizedBox(height: 12,), // 공백을 생성할 때 주로 SizedBox를 활용
              Container(
                height: 50,
                width: 50,
                color: Colors.green,
              ),

              const SizedBox(height: 12,),
              Container(
                height: 50,
                width: 50,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FlexibleWidget extends StatelessWidget {
  const FlexibleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [

              // 화면에 그려지는 widget의 비율을 flex로 지정할 수 있다.
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Container(
                  color: Colors.blue,
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: Container(
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandedWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [

              // Expanded 위젯을 Flexible 위젯을 상속한다. (fit: FlexFit.tight 이 default)
              // Expanded를 사용하면 위젯이 남아있는 공간을 최대한으로 차지하게 된다.
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StackWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // widget을 위에 겹쳐 올린듯한 효과를 준다
          child: Stack(
            children: [
              Container(
                height: 300,
                width: 300,
                color: Colors.red,
              ),
              Container(
                height: 250,
                width: 250,
                color: Colors.yellow,
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
