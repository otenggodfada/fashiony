// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class moDel extends StatefulWidget {
  moDel({Key? key}) : super(key: key);

  @override
  State<moDel> createState() => _moDelState();
}

class _moDelState extends State<moDel> {
  bool isLoadd = true;
  late String title, url;
  final _key = UniqueKey();
  WebViewState(String title, String url) {}
  var c1 = const Color.fromRGBO(242, 234, 242, 3);
  var c2 = const Color.fromARGB(195, 79, 12, 60);
  var c3 = const Color.fromARGB(255, 238, 232, 238);
  var c4 = const Color.fromRGBO(242, 234, 242, 3);
  var c5 = Color.fromARGB(255, 79, 12, 60);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: c5,
          title: Text('Styles'),
        ),
        body: Stack(key: _key, children: <Widget>[
          WebView(
            backgroundColor: Color.fromARGB(255, 79, 12, 60),
            initialUrl: 'https://www.pinterest.com/pin/617345061422925537/',
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoadd = false;
              });
            },
          ),
          isLoadd
              ? Center(
                  child: CircularProgressIndicator(
                    color: c1,
                  ),
                )
              : Stack(),
        ]),
      ),
    );
  }
}
