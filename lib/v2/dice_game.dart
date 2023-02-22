import 'package:flutter/material.dart';

import 'dice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Builder(
        builder: (context) => GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus(); // 화면 속 빈 공간을 터치하면 키보드가 사라짐.
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 50)),
                const Center(
                  child: Image(
                    image: AssetImage("image/chef.gif"),
                    width: 170,
                    height: 190,
                  ),
                ),
                Form(
                    child: Theme(
                  data: ThemeData(
                      primaryColor: Colors.teal,
                      inputDecorationTheme: const InputDecorationTheme(
                          labelStyle:
                              TextStyle(fontSize: 15, color: Colors.teal))),
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        TextField(
                          decoration:
                              InputDecoration(labelText: "Enter 'dice'"),
                          keyboardType: TextInputType.emailAddress,
                          controller: controller,
                        ),
                        TextField(
                          decoration:
                              InputDecoration(labelText: "Enter Password"),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          controller: controller2,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ButtonTheme(
                            child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orangeAccent),
                          ),
                          onPressed: () {
                            var dice = controller.text;
                            var password = controller2.text;

                            if (dice == "dice" && password == "1234") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dice()));
                            } else {
                              showSnackBar(context, "패스워드를 잘못 입력 함.");
                            }
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 25,
                          ),
                        ))
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}
