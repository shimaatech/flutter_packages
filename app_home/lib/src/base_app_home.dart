import 'package:flutter/material.dart';
import 'package:flutter_mobx_helpers/flutter_mobx_helpers.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_utils/mobx_utils.dart';

abstract class BaseAppHome extends StatelessWidget {

  final BaseAppStore appStore;

  BaseAppHome(this.appStore);

  @override
  Widget build(BuildContext context) {
    return ObserverListener(
      listener: (reaction) => observe(context, reaction),
      child: buildHomePage(context),
    );
  }

  Widget buildHomePage(BuildContext context);


  @mustCallSuper
  void observe(BuildContext context, Reaction reaction) {}
}
