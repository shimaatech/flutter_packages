import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multiple_localization/multiple_localization.dart';

import 'l10n/messages_all.dart';

class UpdateDialogLocalizations {
  static Future<UpdateDialogLocalizations> load(Locale locale) {
    return MultipleLocalizations.load(
        initializeMessages, locale, (locale) => UpdateDialogLocalizations());
  }

  static UpdateDialogLocalizations of(BuildContext context) {
    return Localizations.of<UpdateDialogLocalizations>(
        context, UpdateDialogLocalizations);
  }

  static const List<Locale> supportedLocales = const [
    Locale('en'),
    Locale('he'),
    Locale('ar'),
  ];

  // Static member to have a simple access to the delegate from the MaterialApp
  static LocalizationsDelegate<UpdateDialogLocalizations> get delegate =>
      _UpdateDialogLocalizationsDelegate();

  String get title => Intl.message('App Update', name: 'title');

  String get flexibleUpdateMessage => Intl.message(
      'A new update is available. Please update in order to get the latest features',
      name: 'flexibleUpdateMessage');

  String get immediateUpdateMessage => Intl.message(
      'We enhanced the app for you. Please update the app in order to continue',
      name: 'immediateUpdateMessage');

  String get update => Intl.message('Update', name: 'update');

  String get later => Intl.message('Later', name: 'later');
}

class _UpdateDialogLocalizationsDelegate
    extends LocalizationsDelegate<UpdateDialogLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return UpdateDialogLocalizations.supportedLocales.contains(locale);
  }

  @override
  Future<UpdateDialogLocalizations> load(Locale locale) {
    return UpdateDialogLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<UpdateDialogLocalizations> old) {
    return false;
  }
}
