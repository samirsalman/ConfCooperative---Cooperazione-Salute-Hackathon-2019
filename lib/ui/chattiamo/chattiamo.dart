import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Chattiamo extends StatefulWidget {
  @override
  _ChattiamoState createState() => _ChattiamoState();
}

class _ChattiamoState extends State<Chattiamo> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
    ));
    return Scaffold(

      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Assistente vocale (Test)",
          style: TextStyle(fontSize: 16),
        ),

        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 80,
        child: WebView(
          initialUrl: "http://salutewebapi.azurewebsites.net/api/chatbot",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }

  @override
  void initState() {

    super.initState();
  }
}
