import 'dart:io';

import 'package:flutter/material.dart';
import 'package:general_utils/general_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

typedef WebsiteViewerErrorCallback = Function(int code, String message);

class WebsiteViewer extends StatefulWidget {
  WebsiteViewer(this.url, {this.onError});

  final String url;

  final WebsiteViewerErrorCallback onError;

  @override
  _WebsiteViewerState createState() => _WebsiteViewerState();
}

class _WebsiteViewerState extends State<WebsiteViewer> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (finish) {
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (error) {
            if (widget.onError != null) {
              widget.onError(error.errorCode, error.description);
            }
          },
        ),
        if (_isLoading) CircularProgressIndicator(),
      ],
    );
  }
}

class WebsiteViewerDialog {
  static Future<void> show(BuildContext context, String url) {
    return GeneralUtils.showFullScreenDialog(
        context: context, builder: (context) => WebsiteViewer(url));
  }
}
