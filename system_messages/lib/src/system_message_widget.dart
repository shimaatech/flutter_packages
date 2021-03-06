import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dismissible_card/dismissible_card.dart';
import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_viewer/website_viewer.dart';

import '../system_messages.dart';

// TODO maybe it's better to use dynamic widgets in the future...

// TODO add onError, onLoading and onNoData widgets
// Currently we show empty Container() on all these cases...

typedef ClickEventHandler = Function(
    BuildContext context, SystemMessageClickSpec spec);

abstract class NavigatorHelper {
  Future<void> navigate(BuildContext context, String routeName,
      String systemMessageId, Map<String, dynamic>? args);
}

class DismissibleMessage extends StatefulWidget {
  DismissibleMessage({
    required this.message,
    required this.key,
    this.dismissible = true,
    this.onDismiss,
    this.backgroundColor,
    this.linkColor = Colors.blue,
    this.navigatorHelper,
    this.dismissOnNavigation = true,
  }) : super(key: key);

  final Key key;
  final SystemMessage message;
  final bool dismissible;
  final VoidCallback? onDismiss;
  final Color? backgroundColor;
  final Color linkColor;
  final NavigatorHelper? navigatorHelper;
  final bool dismissOnNavigation;

  @override
  _DismissibleMessageState createState() => _DismissibleMessageState();
}

class _DismissibleMessageState extends State<DismissibleMessage> {
  /// For supporting dismiss on navigation
  bool isDismissed = false;

  @override
  Widget build(BuildContext context) {
    if (isDismissed) {
      return Container();
    }

    final titleIcon = widget.message.titleIcon;
    final bgColor = widget.message.backgroundColor;

    return DismissibleCard(
      key: widget.key,
      content: widget.message.content,
      title: widget.message.title,
      isDismissible: widget.dismissible,
      onDismiss: widget.onDismiss,
      titleIconData: titleIcon != null
          ? IconData(titleIcon, fontFamily: 'MaterialIcons')
          : null,
      onTitleIconClick: () =>
          handleClickEvent(context, widget.message.titleIconClickSpec),
      linkText: widget.message.linkText,
      onLinkClick: () =>
          handleClickEvent(context, widget.message.linkClickSpec),
      imageUrl: widget.message.image?.url,
      imageWidth: widget.message.image?.width ?? 80,
      imageHeight: widget.message.image?.height ?? 80,
      backgroundColor:
          bgColor != null ? Color(bgColor) : widget.backgroundColor,
      linkColor: widget.linkColor,
      onCardClick: () =>
          handleClickEvent(context, widget.message.cardClickSpec),
    );
  }

  void handleClickEvent(
      BuildContext context, SystemMessageClickSpec? clickSpec) {
    // First dismiss (so that we don't pop the windows that are opened by the
    // click event in case onDismiss() pops something)
    if (widget.dismissOnNavigation) {
      widget.onDismiss?.call();
      setState(() {
        isDismissed = true;
      });
    }
    if (widget.navigatorHelper == null || clickSpec == null) {
      return;
    }
    if (clickSpec.navigationType == NavigationType.internal) {
      widget.navigatorHelper
          ?.navigate(context, clickSpec.url, widget.message.id, clickSpec.args);
    } else if (clickSpec.navigationType == NavigationType.embedded) {
      WebsiteViewerDialog.show(context, clickSpec.url);
    } else if (clickSpec.navigationType == NavigationType.upgrade ||
        clickSpec.navigationType == NavigationType.rate) {
      LaunchReview.launch();
    } else {
      launch(clickSpec.url);
    }
  }
}

class SystemMessageCard extends StatelessWidget {
  SystemMessageCard({
    required this.systemMessagesService,
    required this.langCode,
    this.dismissible = true,
    this.backgroundColor,
    this.linkColor,
    this.onMessageLoading,
    this.navigatorHelper,
    this.dismissOnNavigation = true,
    this.fetchInterval = const Duration(hours: 24),
    this.additionalPackages,
  });

  final SystemMessagesService systemMessagesService;
  final bool dismissible;
  final Color? backgroundColor;
  final Color? linkColor;
  final Widget? onMessageLoading;
  final NavigatorHelper? navigatorHelper;
  final bool dismissOnNavigation;
  final Logger logger = Logger();
  final Duration fetchInterval;
  final String langCode;
  final List<String>? additionalPackages;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SystemMessage?>(
      future: systemMessagesService.getLatestUnexpiredMessage(
        SystemMessageType.normal,
        langCode,
        fetchInterval,
        additionalPackages: additionalPackages ?? const [],
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          logger.e('Error while loading system messages: ${snapshot.error}');
        }
        final snapshotData = snapshot.data;
        if (snapshot.hasData && snapshotData != null) {
          SystemMessage message = snapshotData;
          return DismissibleMessage(
            key: Key(message.id),
            message: message,
            dismissible: dismissible,
            onDismiss: () => systemMessagesService.dismissMessage(message.id),
            navigatorHelper: navigatorHelper,
            backgroundColor: backgroundColor,
            linkColor: linkColor ?? Colors.blue,
            dismissOnNavigation: dismissOnNavigation,
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class SystemMessageDialog {
  static void dismissMessage(
      BuildContext context, SystemMessagesService service, String messageId) {
    service.dismissMessage(messageId);
    Navigator.of(context, rootNavigator: true).pop();
  }

  static Future<void> showNewMessage({
    required BuildContext context,
    required SystemMessagesService service,
    required String langCode,
    Color? backgroundColor,
    Color? linkColor,
    NavigatorHelper? navigatorHelper,
    bool dismissOnNavigation = true,
    String okButtonText = 'OK',
    Duration fetchInterval = const Duration(hours: 24),
    List<String>? additionalPackages,
  }) async {
    final message = await service.getLatestUnexpiredMessage(
        SystemMessageType.dialog, langCode, fetchInterval,
        additionalPackages: additionalPackages ?? const []);
    if (message == null) {
      return;
    }

    AwesomeDialog dialog = AwesomeDialog(
      context: context,
      dialogBackgroundColor: backgroundColor,
      dialogType: DialogType.NO_HEADER,
      btnOk: ElevatedButton(
        child: Text(okButtonText),
        onPressed: () => dismissMessage(context, service, message.id),
      ),
      body: DismissibleMessage(
        message: message,
        key: Key(message.id),
        navigatorHelper: navigatorHelper,
        backgroundColor: backgroundColor,
        linkColor: linkColor ?? Colors.blue,
        dismissible: false,
        dismissOnNavigation: true,
        onDismiss: () => dismissMessage(context, service, message.id),
      ),
    );

    return dialog.show();
  }
}
