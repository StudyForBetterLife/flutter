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
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(
                    width: 16.0,
                    color: Colors.black
                  ),
                  borderRadius: BorderRadius.circular(16.0,)
                ),
                width: 100.0,
                height: 200.0,
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: Container(
                  color: Colors.red,
                ),
              ),

              // padding 적용하기
              Container(
                color: Colors.blue,
                child: Padding(

                  // 상하 좌우로 16 픽셀만큼 패딩 적용
                  padding: EdgeInsets.all(16.0),

                  // 패딩을 적용할 하위 위젯
                  child: Container(
                    color: Colors.red,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),

              // margin 적용하기
              Container( // 1. margin이 적용될 대상 (검정 컨테이너)
                color: Colors.black,
                child: Container( // 2. 중간 파란 컨테이너
                  color: Colors.blue,

                  // margin 적용 위치
                  margin: EdgeInsets.all(16),

                  // 패딩 적용
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Container( // 3. padding이 적용된 빨간 컨테이너
                      color: Colors.red,
                      width: 50,
                      height: 50,
                    ),
                  ),


                ),
              )
            ],
          )
        ),
      ),
    );
  }
}

class MySafeAreaWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // 노치 부분에 위젯을 그릴 경우, top|bottom|left|right 속성을 false(default) 해둔다.
            child: SafeArea(
              child: Container(
                color: Colors.red,
                width: 300,
                height: 300,
              ),
            )
        ),
      ),
    );
  }
}
