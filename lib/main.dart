import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/view/router.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: routers,);
  }
}

class WebViewEx extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('webviewEssssa')),
      body: Builder(
        builder: (BuildContext context) {
          return App();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        onPressed: () async {
//          String js = await rootBundle.loadString('assets/js/test.js');
//          await _controller.evaluateJavascript(js);
        },
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  _getAssetsHtml() async {
    String html = await rootBundle.loadString('assets/tree.html');
    _controller.future.then((controller) {
      controller.loadUrl(Uri.dataFromString(html,
              mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
          .toString());
    });
  }

  _getAssetsJs() async {
    String js = await rootBundle.loadString('assets/js/three.js');
//    var js_ = Uri.dataFromString(js, mimeType: 'text/javascript', encoding: Encoding.getByName('utf-8'));
    await _controller.future.then((controller) {
      controller.evaluateJavascript(js.toString());
    });
    print('123');
    sleep(Duration(seconds: 5));
    print('555');
    String js2 = await rootBundle.loadString('assets/js/test.js');
//    var js2_ = Uri.dataFromString(js, mimeType: 'text/javascript', encoding: Encoding.getByName('utf-8'));
    await _controller.future.then((controller) {
      controller.evaluateJavascript(js2.toString());
    });
  }
}
