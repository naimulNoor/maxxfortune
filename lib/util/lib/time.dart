import 'package:intl/intl.dart';

class TimeUtil {
  static String getFormattedDate(
    DateTime dateTime,
    String format,
  ) {
    return DateFormat(format).format(dateTime);
  }

  static String getFormattedDateFromText(
    String dateTime,
    String givenFormat,
    String desiredFormat,
  ) {
    DateTime receivedDateTime = DateFormat(givenFormat).parse(dateTime);
    return DateFormat(desiredFormat).format(receivedDateTime);
  }

  static DateTime getDateFromText(
    String dateTime,
    String givenFormat,
  ) {
    return DateFormat(givenFormat).parse(dateTime);
  }

  static Duration getDifferenceBetweenTwoDates({
     required DateTime from,
     required DateTime to,
  }) {
    return from.difference(to);
  }
}
