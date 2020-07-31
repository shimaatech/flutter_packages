import 'package:dismissible_card/dismissible_card.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:website_viewer/website_viewer.dart';

import '../system_messages.dart';

// TODO maybe it's better to use dynamic widgets in the future...

// TODO add onError, onLoading and onNoData widgets
// Currently we show empty Container() on all these cases...

abstract class NavigatorHelper {
  Future<void> navigate(
      BuildContext context, String routeName, Map<String, dynamic> args);
}

class SystemMessageCard extends StatefulWidget {
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

  @override
  _SystemMessageCardState createState() => _SystemMessageCardState();
}

class _SystemMessageCardState extends State<SystemMessageCard> {
  Future<SystemMessage> messageFuture;
  SystemMessagesService service;
  final Logger logger = Logger();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    service = widget.systemMessagesService ??
        Provider.of<SystemMessagesService>(context);
    if (messageFuture == null) {
      messageFuture =
          service.getLatestUnexpiredMessage(SystemMessageType.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SystemMessage>(
      future: messageFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          logger.e('Error while loading system messages: ${snapshot.error}');
        }
        if (snapshot.hasData && snapshot.data != null) {
          SystemMessage message = snapshot.data;
          return DismissibleCard(
            key: widget.key,
            content: message.content,
            title: message.title,
            isDismissible: widget.dismissible,
            onDismiss: () => service.dismissMessage(message.id),
            titleIconData: message.titleIcon != null
                ? IconData(message.titleIcon, fontFamily: 'MaterialIcons')
                : null,
            onTitleIconClick: () =>
                handleClickEvent(message.titleIconClickSpec, context),
            linkText: message.linkText,
            onLinkClick: () => handleClickEvent(message.linkClickSpec, context),
            imageUrl: message.image?.url,
            imageWidth: message.image?.width ?? 80,
            imageHeight: message.image?.height ?? 80,
            backgroundColor: message.backgroundColor != null
                ? Color(message.backgroundColor)
                : widget.backgroundColor,
            onCardClick: () => handleClickEvent(message.cardClickSpec, context),
          );
        } else {
          return Container();
        }
      },
    );
  }

  void handleClickEvent(
      SystemMessageClickSpec clickSpec, BuildContext context) {
    if (widget.navigatorHelper == null || clickSpec == null) {
      return;
    }
    if (clickSpec.navigationType == NavigationType.internal) {
      widget.navigatorHelper.navigate(context, clickSpec.url, clickSpec.args);
    } else {
      showDialog(
          context: context, builder: (context) => WebsiteViewer(clickSpec.url));
    }
  }
}
