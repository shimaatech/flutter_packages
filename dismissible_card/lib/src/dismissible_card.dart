import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class DismissibleCard extends StatefulWidget {
  DismissibleCard({
    required this.key,
    required this.content,
    this.title,
    this.isDismissible = true,
    this.onDismiss,
    this.linkText,
    this.linkColor = Colors.blue,
    this.onLinkClick,
    this.titleIconData,
    this.onTitleIconClick,
    this.imageUrl,
    this.onCardClick,
    this.backgroundColor,
    this.titleColor,
    this.contentColor,
    this.imageWidth = 80,
    this.imageHeight = 80,
  }) : super(key: key);

  final Key key;
  final String? title;
  final String content;
  final bool isDismissible;
  final VoidCallback? onDismiss;
  final String? linkText;
  final Color linkColor;
  final IconData? titleIconData;
  final VoidCallback? onTitleIconClick;
  final VoidCallback? onLinkClick;
  final VoidCallback? onCardClick;
  final String? imageUrl;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? contentColor;
  final double imageWidth;
  final double imageHeight;

  @override
  _DismissibleCardState createState() => _DismissibleCardState();
}

class _DismissibleCardState extends State<DismissibleCard> {
  bool isDismissed = false;

  void onDismiss() {
    widget.onDismiss?.call();
    setState(() {
      isDismissed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isDismissed) {
      return Container();
    }
    return Dismissible(
      key: widget.key,
      onDismissed: (_) => onDismiss(),
      child: InkWell(
        onTap: widget.onCardClick,
        child: Card(
          color: widget.backgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildHeader(context),
              buildBody(context),
            ],
          ),
        ),
      ),
    );
  }

  buildHeader(BuildContext context) {
    return Row(
      children: <Widget>[
        buildDismissButton(context),
        Expanded(
          child: buildTitle(context),
        ),
      ],
    );
  }

  buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildImage(context),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: buildContent(context),
          ),
        ],
      ),
    );
  }

  buildFooter(BuildContext context) {
    final linkText = widget.linkText;
    if (linkText == null) {
      return Container();
    }
    return TextButton(
      child: Text(
        linkText,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(color: widget.linkColor),
      ),
      onPressed: widget.onLinkClick,
    );
  }

  buildDismissButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.clear, color: Colors.grey),
      onPressed: onDismiss,
    );
  }

  buildTitle(BuildContext context) {
    if (widget.title == null && widget.titleIconData == null) {
      return Container();
    }
    return Row(
      children: <Widget>[
        Expanded(
          child: widget.title != null
              ? Html(
                  data: widget.title,
                  style: {
                    'html': Style(color: widget.titleColor),
                  },
                )
              : Container(),
        ),
        buildTitleIcon(context),
      ],
    );
  }

  buildTitleIcon(BuildContext context) {
    if (widget.titleIconData == null) {
      return Container();
    }
    return IconButton(
      icon: Icon(widget.titleIconData),
      onPressed: widget.onTitleIconClick,
    );
  }

  Widget buildImage(BuildContext context) {
    if (widget.imageUrl == null) {
      return Container();
    }
    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      width: widget.imageWidth,
      height: widget.imageHeight,
    );
  }

  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Html(
          data: widget.content,
          style: {
            'html': Style(
              color: widget.contentColor,
            ),
          },
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            buildFooter(context),
          ],
        ),
      ],
    );
  }
}
