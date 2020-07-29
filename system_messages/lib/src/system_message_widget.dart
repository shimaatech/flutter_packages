import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../system_messages.dart';

class SystemMessageCard extends StatefulWidget {
  SystemMessageCard({
    @required this.langCode,
    this.systemMessagesService,
    this.dismissable = true,
    Key key,
  })  : assert(langCode != null),
        super(key: key);

  final SystemMessagesService systemMessagesService;
  final String langCode;
  final bool dismissable;

  @override
  _SystemMessageCardState createState() => _SystemMessageCardState();
}

class _SystemMessageCardState extends State<SystemMessageCard> {
  bool isDismissed = false;
  Future<SystemMessage> messageFuture;
  SystemMessagesService service;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    service = widget.systemMessagesService ??
        Provider.of<SystemMessagesService>(context);
    if (messageFuture == null) {
      messageFuture = service.getLatestUnexpiredMessage(
          widget.langCode, SystemMessageType.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SystemMessage>(
      future: messageFuture,
      builder: (context, snapshot) {
        if (!isDismissed && snapshot.hasData && snapshot.data != null) {
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
