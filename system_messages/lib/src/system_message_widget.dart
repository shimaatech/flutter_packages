import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../system_messages.dart';

class SystemMessageCard extends StatefulWidget {
  SystemMessageCard({
    this.systemMessagesService,
    this.dismissible = true,
    this.backgroundColor,
    Key key,
  }) : super(key: key);

  final SystemMessagesService systemMessagesService;
  final bool dismissible;
  final Color backgroundColor;

  @override
  _SystemMessageCardState createState() => _SystemMessageCardState();
}

class _SystemMessageCardState extends State<SystemMessageCard> {
  bool isDismissed = false;
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
        if (!isDismissed && snapshot.hasData && snapshot.data != null) {
          logger.i('Loaded system messasge: ${snapshot.data}');
          return widget.dismissible
              ? Dismissible(
                  key: Key('system_message'),
                  onDismissed: (direction) => dismissMessage(),
                  child: buildMessageCard(snapshot.data),
                )
              : buildMessageCard(snapshot.data);
        } else {
          return Container();
        }
      },
    );
  }

  Widget buildMessageCard(SystemMessage message) {
    return Card(
      color: widget.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            widget.dismissible
                ? Container(
                    alignment: Alignment.topRight,
                    child: buildDismissButton(message),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message.content,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDismissButton(SystemMessage message) {
    return IconButton(
      icon: Icon(
        Icons.clear,
        color: Colors.grey,
      ),
      onPressed: () {
        service.dismissMessage(message.id);
        dismissMessage();
      },
    );
  }

  void dismissMessage() {
    setState(() {
      isDismissed = true;
    });
  }
}
