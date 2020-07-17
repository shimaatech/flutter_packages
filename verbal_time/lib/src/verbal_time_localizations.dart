import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/verbaltime_messages_all.dart';

class VerbalTimeLocalizations {
  static const String _defaultTimeFormat = 'HH:mm';
  static const String _defaultDateFormat = 'dd/MM';
  static const String _defaultSeparator = ' ';
  static const Locale defaultDateFormatLocale = Locale('en');

  final Locale locale;
  final Locale dateFormatLocale;

  VerbalTimeLocalizations(this.locale, bool useLocaleForDate)
      : dateFormatLocale = useLocaleForDate ? locale : defaultDateFormatLocale;

  static Future<VerbalTimeLocalizations> load(
      Locale locale, bool useLocaleForDate) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new VerbalTimeLocalizations(locale, useLocaleForDate);
    });
  }

  static VerbalTimeLocalizations of(BuildContext context) {
    return Localizations.of<VerbalTimeLocalizations>(
        context, VerbalTimeLocalizations);
  }

  static const List<Locale> supportedLocales = const [
    Locale('en'),
    Locale('he'),
    Locale('ar'),
  ];

  // Static member to have a simple access to the delegate from the MaterialApp
  static LocalizationsDelegate<VerbalTimeLocalizations> delegate(
          {bool useLocaleForDate = false}) =>
      _VerbalTimeLocalizationsDelegate(useLocaleForDate);

  @protected
  String minutes(int count) {
    return Intl.pluralLogic(
      count,
      zero: now,
      one: oneMinute,
      two: twoMinutes,
      few: fewMinutes(count),
      many: manyMinutes(count),
      other: manyMinutes(count),
    );
  }

  @protected
  String hours(int count) {
    return Intl.pluralLogic(
      count,
      one: oneHour,
      two: twoHours,
      few: fewHours(count),
      many: manyHours(count),
      other: manyHours(count),
    );
  }

  @protected
  String get now => Intl.message('Now', name: 'now');

  @protected
  String get oneMinute => Intl.message('1 minute', name: 'oneMinute');

  @protected
  String get twoMinutes => Intl.message('2 minutes', name: 'twoMinutes');

  @protected
  String fewMinutes(int count) =>
      Intl.message('$count minutes', name: 'fewMinutes', args: [count]);

  @protected
  String manyMinutes(int count) =>
      Intl.message('$count minutes', name: 'manyMinutes', args: [count]);

  @protected
  String get oneHour => Intl.message('1 hour', name: 'oneHour');

  @protected
  String get twoHours => Intl.message('2 hours', name: 'twoHours');

  @protected
  String fewHours(int count) =>
      Intl.message('$count hours', name: 'fewHours', args: [count]);

  @protected
  String manyHours(int count) =>
      Intl.message('$count hours', name: 'manyHours', args: [count]);

  @protected
  String today(String time) =>
      Intl.message('Today $time', name: 'today', args: [time]);

  @protected
  String yesterday(String time) =>
      Intl.message('Yesterday $time', name: 'yesterday', args: [time]);

  String verbalTime(DateTime time) {
    DateTime now = DateTime.now();
    DateTime yesterdayTime = now.subtract(Duration(days: 1));

    // Special case... Check if it's yesterday (difference will return a duration)
    // The difference between today and yesterday might be 1 minute!!
    if (time.day == yesterdayTime.day &&
        time.month == yesterdayTime.month &&
        time.year == time.year) {
      String strTime =
          DateFormat(_defaultTimeFormat, dateFormatLocale.languageCode)
              .format(time);
      return this.yesterday(strTime);
    }

    Duration timeDiffDuration = now.difference(time);

    // older than yesterday (we don't check if it's > 1 because it might not be)
    // but we already handled yesterday. Check the comment above
    if (timeDiffDuration.inDays > 0) {
      return DateFormat(
              '$_defaultDateFormat$_defaultSeparator$_defaultTimeFormat',
              locale.languageCode)
          .format(time);
    }

    int minutesDiff = timeDiffDuration.inMinutes;
    if (minutesDiff < 60) {
      return this.minutes(minutesDiff);
    }
    return this.hours(timeDiffDuration.inHours);
  }
}

class _VerbalTimeLocalizationsDelegate
    extends LocalizationsDelegate<VerbalTimeLocalizations> {
  const _VerbalTimeLocalizationsDelegate(this.useLocaleForDate);

  final bool useLocaleForDate;

  @override
  bool isSupported(Locale locale) {
    return VerbalTimeLocalizations.supportedLocales.contains(locale);
  }

  @override
  Future<VerbalTimeLocalizations> load(Locale locale) {
    return VerbalTimeLocalizations.load(locale, useLocaleForDate);
  }

  @override
  bool shouldReload(LocalizationsDelegate<VerbalTimeLocalizations> old) {
    return false;
  }
}
