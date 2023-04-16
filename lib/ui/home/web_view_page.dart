import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewPage extends StatefulWidget {
  String url;
  WebViewPage({Key? key,required this.url }) : super(key: key);
  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
    //  initialUrl: 'http://m7card.manarhays.com/how-to-use/${widget.categoryId}',
      initialUrl:widget.url,
    );
  }
}
