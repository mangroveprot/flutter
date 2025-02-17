import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

//Example Output: Thu, 5/23/2013 10:21:47 AM
String formatDate(Timestamp timestamp) {
  DateTime date = timestamp.toDate(); // Convert Timestamp to DateTime
  return DateFormat('E, M/d/yyyy hh:mm:ss a').format(date);
}
