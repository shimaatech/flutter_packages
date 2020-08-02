import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dismissible_card/dismissible_card.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:website_viewer/website_viewer.dart';

import '../system_messages.dart';

// TODO maybe it's better to use dynamic widgets in the future...

// TODO add onError, onLoading and onNoData widgets
// Currently we show empty Container() on all these cases...

typedef ClickEventHandler = Function(
    BuildContext context, SystemMessageClickSpec spec);

abstract class NavigatorHelper {
  Future<void> navigate(BuildContext context, String routeName,
      Map<String, dynamic> args);
}

class DismissibleMessage extends StatelessWidget {
  DismissibleMessage({
    @required this.message,
    @required Key key,
    this.dismissible = true,
    this.onDismiss,
    this.backgroundColor,
    this.navigatorHelper,
  }) : super(key: key);

  final SystemMessage message;
  final bool dismissible;
  final VoidCallback onDismiss;
  final Color backgroundColor;
  final NavigatorHelper navigatorHelper;

  @override
  Widget build(BuildContext context) {
    return DismissibleCard(
      key: key,
      content: message.content,
      title: message.title,
      isDismissible: dismissible,
      onDismiss: onDismiss,
      titleIconData: message.titleIcon != null
          ? IconData(message.titleIcon, fontFamily: 'MaterialIcons')
          : null,
      onTitleIconClick: () =>
          handleClickEvent(context, message.titleIconClickSpec),
      linkText: message.linkText,
      onLinkClick: () => handleClickEvent(context, message.linkClickSpec),
      imageUrl: message.image?.url,
      imageWidth: message.image?.width ?? 80,
      imageHeight: message.image?.height ?? 80,
      backgroundColor: message.backgroundColor != null
          ? Color(message.backgroundColor)
          : backgroundColor,
      onCardClick: () => handleClickEvent(context, message.cardClickSpec),
    );
  }

  void handleClickEvent(BuildContext context,
      SystemMessageClickSpec clickSpec) {
    if (navigatorHelper == null || clickSpec == null) {
      return;
    }
    if (message.type == SystemMessageType.dialog) {
      // hide the dialog before navigating...
      Navigator.pop(context);
    }
    if (clickSpec.navigationType == NavigationType.internal) {
      navigatorHelper.navigate(context, clickSpec.url, clickSpec.args);
    } else {
      showDialog(
          context: context, builder: (context) => WebsiteViewer(clickSpec.url));
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
    Key key = const Key('__system_message'),
  }) : super(key: key);

  final SystemMessagesService systemMessagesService;
  final bool dismissible;
  final Color backgroundColor;
  final Widget onMessageLoading;
  final NavigatorHelper navigatorHelper;
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
  }) async {
    SystemMessage message = await service.getLatestUnexpiredMessage(
        SystemMessageType.dialog);
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
      ),
    );

    return dialog.show();
  }
}
