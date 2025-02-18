// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

//Example Output: Thu, 5/23/2013 10:21:47 AM
String formatDate(Timestamp timestamp) {
  DateTime date = timestamp.toDate(); // Convert Timestamp to DateTime
  return DateFormat('E, M/d/yyyy hh:mm:ss a').format(date);
}

// Custom Logger
class CustomLog {
  static const String reset = '\x1B[0m';
  static const String red = '\x1B[31m';
  static const String green = '\x1B[32m';
  static const String yellow = '\x1B[33m';
  static const String blue = '\x1B[34m';

  static void success({String message = 'SUCCESS', required object}) {
    print('$green$message: $object$reset');
  }

  static void error({String message = 'ERROR', required dynamic object}) {
    print('$red$message: $object$reset');
  }

  static void warning({String message = 'WARNING', required dynamic object}) {
    print('$yellow$message: $object$reset');
  }

  static void custom(
      {String message = 'CUSTOM',
      required dynamic object,
      String color = reset}) {
    print('$color$message: $object$reset');
  }
}
