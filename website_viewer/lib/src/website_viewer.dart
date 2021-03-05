import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:general_utils/general_utils.dart';

typedef WebsiteViewerErrorCallback = Function(int code, String message);

class WebsiteViewer extends StatefulWidget {
  WebsiteViewer(this.url, {this.onLoadError, this.onLoadHttpError});

  final String url;

  final WebsiteViewerErrorCallback? onLoadError;
  final WebsiteViewerErrorCallback? onLoadHttpError;

  @override
  _WebsiteViewerState createState() => _WebsiteViewerState();
}

class _WebsiteViewerState extends State<WebsiteViewer> {
  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        (_progress != 1.0)
            ? LinearProgressIndicator(value: _progress)
            : Container(),
        Expanded(
          child: InAppWebView(
            onLoadError: (controller, url, code, message) {
              widget.onLoadError?.call(code, message);
            },
            onLoadHttpError: (controller, url, code, message) {              
                widget.onLoadHttpError?.call(code, message);
            },
            initialUrlRequest: URLRequest(url: Uri.dataFromString(widget.url)),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(),
            ),
            onProgressChanged: (controller, progress) => _setProgress(progress),
          ),
        ),
      ],
    );
  }

  void _setProgress(int progress) {
    setState(() {
      _progress = progress / 100;
    });
  }
}

class WebsiteViewerDialog {
  static Future<void> show(BuildContext context, String url) {
    return GeneralUtils.showFullScreenDialog(
        context: context, builder: (context) => WebsiteViewer(url));
  }
}
