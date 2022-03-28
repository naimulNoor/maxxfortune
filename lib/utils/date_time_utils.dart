import 'package:intl/intl.dart';

String speakDate(DateTime dateTime){
  var day = dateTime.day;
  var month = DateFormat.MMM().format(dateTime);
  var year = dateTime.year;
  return "$day $month, $year";
}

String daysBetween(DateTime from) {
  DateTime to = DateTime.now();
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);

  int day = (to.difference(from).inHours / 24).round();
  int hr = to.difference(from).inHours;

  // if(day<1){
  //   return "$hr ${(hr==1) ? "hr" : "hrs"}";
  // }

  return "$day ${(day==1) ? "day" : "days"}";
}

int daysDiff(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);

  int day = (to.difference(from).inHours / 24).round();

  return day;
}