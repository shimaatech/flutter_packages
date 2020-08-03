import 'package:flutter/material.dart';

class GeneralUtils {
  static Future<T> showFullScreenDialog<T>({
    @required BuildContext context,
    @required WidgetBuilder builder,
    bool showCloseButton = true,
  }) {
    return showGeneralDialog<T>(
      context: context,
      pageBuilder: (context, animation1, animation2) => Container(),
      transitionDuration: Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierLabel: '',
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: Scaffold(
              body: SafeArea(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () =>
                              Navigator.of(context, rootNavigator: true).pop(),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Expanded(child: builder(context)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
