import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Teste de webviewer",
      theme: ThemeData(primarySwatch: Colors.amber
      ),
      home: const WebViewDemo(),
    );
  }
}


class WebViewDemo extends StatefulWidget {
  const WebViewDemo({super.key});

  @override
  State<WebViewDemo> createState() => _WebViewDemoState();
}

class _WebViewDemoState extends State<WebViewDemo> {
  WebViewController controller = WebViewController();
  
  @override
  void initState(){
    super.initState();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Color.fromARGB(0, 0, 0, 0))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) => {},
        onPageStarted: (url) => {},
        onPageFinished: (url) => {},
      ))
      ..loadRequest(Uri.parse('https://www.vozdocliente.com.br/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 32, 25),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 59, 26),
        title: const Text('Voz do cliente', style: TextStyle(color: Colors.white),),),
      body: WebViewWidget(controller: controller),
    );
  }
}