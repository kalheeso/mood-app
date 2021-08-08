import 'package:intl/intl.dart';

class UtilDate {
  static String convertDateTime(DateTime dateTime) {
    try {
      return DateFormat("hh:mm dd/MM").format(dateTime);
    } catch (e) {
      return "";
    }
  }
}
