import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  WebViewController? controller;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Code Factory"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                controller?.goBack();
              },
              icon: Icon(Icons.arrow_back)),
          IconButton(
              onPressed: () {
                controller?.goForward();
              },
              icon: Icon(Icons.arrow_forward)),
          IconButton(
            onPressed: () {
              // WebViewController를 통해 웹뷰를 제어할 수 있다.
              controller?.loadUrl("https://velog.io/@guswns3371");
            },
            icon: Icon(Icons.home),
          )
        ],
      ),
      body: WebView(
        onWebViewCreated: (WebViewController controller) {
          // WebViewController 변수를 초기화 한다.
          this.controller = controller;
        },
        initialUrl: "https://blog.codefactory.ai",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
