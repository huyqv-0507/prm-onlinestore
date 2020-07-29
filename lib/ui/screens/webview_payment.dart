import 'package:flutter/material.dart';
import 'package:online_store/helpers/colors/color_helper.dart';
import 'package:online_store/ui/components/success.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VNPayWebView extends StatefulWidget {
  final String url;

  const VNPayWebView({Key key, this.url}) : super(key: key);
  @override
  _VNPayWebViewState createState() => _VNPayWebViewState();
}

class _VNPayWebViewState extends State<VNPayWebView> {
  WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    print('${widget.url}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorHelper.bgColor,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
            color: Colors.grey[600],
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Payment online',
          style: TextStyle(color: Colors.grey[600]),
        ),
      ),
      body: WebView(
        onWebViewCreated: (WebViewController webViewController) =>
            {_webViewController = webViewController},
        navigationDelegate: (navigation) {
          if (navigation.url.contains('https://vnpay.vn/')) {
            print(_webViewController.toString());
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SuccessNotification()));
            return NavigationDecision.navigate;
          }
          _webViewController.loadUrl(navigation.url);
          return NavigationDecision.prevent;
        },
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
