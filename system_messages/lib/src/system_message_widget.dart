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
  Future<void> navigate(
      BuildContext context, String routeName, Map<String, dynamic> args);
}

class DismissibleMessage extends StatefulWidget {
  DismissibleMessage({
    @required this.message,
    @required Key key,
    this.dismissible = true,
    this.onDismiss,
    this.backgroundColor,
    this.navigatorHelper,
    this.dismissOnNavigation = true,
  }) : super(key: key);

  final SystemMessage message;
  final bool dismissible;
  final VoidCallback onDismiss;
  final Color backgroundColor;
  final NavigatorHelper navigatorHelper;
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
    return DismissibleCard(
      key: widget.key,
      content: widget.message.content,
      title: widget.message.title,
      isDismissible: widget.dismissible,
      onDismiss: widget.onDismiss,
      titleIconData: widget.message.titleIcon != null
          ? IconData(widget.message.titleIcon, fontFamily: 'MaterialIcons')
          : null,
      onTitleIconClick: () =>
          handleClickEvent(context, widget.message.titleIconClickSpec),
      linkText: widget.message.linkText,
      onLinkClick: () =>
          handleClickEvent(context, widget.message.linkClickSpec),
      imageUrl: widget.message.image?.url,
      imageWidth: widget.message.image?.width ?? 80,
      imageHeight: widget.message.image?.height ?? 80,
      backgroundColor: widget.message.backgroundColor != null
          ? Color(widget.message.backgroundColor)
          : widget.backgroundColor,
      onCardClick: () =>
          handleClickEvent(context, widget.message.cardClickSpec),
    );
  }

  void handleClickEvent(
      BuildContext context, SystemMessageClickSpec clickSpec) {
    if (widget.navigatorHelper == null || clickSpec == null) {
      return;
    }
    if (widget.message.type == SystemMessageType.dialog) {
      // hide the dialog before navigating...
      Navigator.pop(context);
    }
    if (clickSpec.navigationType == NavigationType.internal) {
      widget.navigatorHelper.navigate(context, clickSpec.url, clickSpec.args);
    } else if (clickSpec.navigationType == NavigationType.embedded) {
      WebsiteViewerDialog.show(context, clickSpec.url);
    } else if (clickSpec.navigationType == NavigationType.upgrade) {
      LaunchReview.launch();
    } else {
      launch(clickSpec.url);
    }
    if (widget.dismissOnNavigation) {
      widget.onDismiss();
      setState(() {
        isDismissed = true;
      });
    }
  }
}

class SystemMessageCard extends StatelessWidget {
  SystemMessageCard({
    this.systemMessagesService,
    this.dismissible = true,
    this.backgroundColor,
    this.onMessageLoading,
    this.navigatorHelper,
    this.dismissOnNavigation = true,
    Key key = const Key('__system_message'),
  }) : super(key: key);

  final SystemMessagesService systemMessagesService;
  final bool dismissible;
  final Color backgroundColor;
  final Widget onMessageLoading;
  final NavigatorHelper navigatorHelper;
  final bool dismissOnNavigation;
  final Logger logger = Logger();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SystemMessage>(
      future: systemMessagesService
          .getLatestUnexpiredMessage(SystemMessageType.normal),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          logger.e('Error while loading system messages: ${snapshot.error}');
        }
        if (snapshot.hasData && snapshot.data != null) {
          SystemMessage message = snapshot.data;
          return DismissibleMessage(
            key: key,
            message: message,
            dismissible: dismissible,
            onDismiss: () => systemMessagesService.dismissMessage(message.id),
            navigatorHelper: navigatorHelper,
            backgroundColor: backgroundColor,
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
  static const Key key = const Key('__system_message_dialog');

  static Future<void> showNewMessage({
    @required BuildContext context,
    @required SystemMessagesService service,
    Color backgroundColor,
    NavigatorHelper navigatorHelper,
    bool dismissOnNavigation = true,
  }) async {
    SystemMessage message =
        await service.getLatestUnexpiredMessage(SystemMessageType.dialog);
    if (message == null) {
      return;
    }

    AwesomeDialog dialog = AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO,
      onDissmissCallback: () => service.dismissMessage(message.id),
      btnOkText: '',
      btnOkIcon: Icons.done,
      btnOkColor: Colors.green,
      btnOkOnPress: () => service.dismissMessage(message.id),
      body: DismissibleMessage(
        message: message,
        key: key,
        navigatorHelper: navigatorHelper,
        backgroundColor: backgroundColor,
        dismissible: false,
        dismissOnNavigation: true,
        onDismiss: () => service.dismissMessage(message.id),
      ),
    );

    return dialog.show();
  }
}
