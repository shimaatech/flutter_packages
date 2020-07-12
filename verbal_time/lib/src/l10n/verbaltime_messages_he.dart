// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a he locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'he';

  static m0(count) => "${count} שעות";

  static m1(count) => "${count} דקות";

  static m2(count) => "${count} שעות";

  static m3(count) => "${count} דקות";

  static m4(time) => "היום ${time}";

  static m5(time) => "אתמול ${time}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "fewHours" : m0,
    "fewMinutes" : m1,
    "manyHours" : m2,
    "manyMinutes" : m3,
    "now" : MessageLookupByLibrary.simpleMessage("עכשיו"),
    "oneHour" : MessageLookupByLibrary.simpleMessage("שעה"),
    "oneMinute" : MessageLookupByLibrary.simpleMessage("דקה"),
    "today" : m4,
    "twoHours" : MessageLookupByLibrary.simpleMessage("2 שעות"),
    "twoMinutes" : MessageLookupByLibrary.simpleMessage("2 דקות"),
    "yesterday" : m5
  };
}
