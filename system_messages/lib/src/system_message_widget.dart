import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../system_messages.dart';

class SystemMessageCard extends StatefulWidget {
  SystemMessageCard({
    this.systemMessagesService,
    this.dismissable = true,
    Key key,
  }) : super(key: key);

  final SystemMessagesService systemMessagesService;
  final bool dismissable;

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
          return buildMessageCard(snapshot.data);
        } else {
          return Container();
        }
      },
    );
  }

  Widget buildMessageCard(SystemMessage message) {
    return Card(
      child: Column(
        children: <Widget>[
          widget.dismissable ? buildDismissButton(message) : Container(),
          Text(message.content),
        ],
      ),
    );
  }

  Widget buildDismissButton(SystemMessage message) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            service.dismissMessage(message.id);
            setState(() {
              isDismissed = true;
            });
          },
        ),
      ],
    );
  }
}
