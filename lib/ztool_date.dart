import 'package:intl/intl.dart';

class ZzDate {
  static String formatformstring(DateTime date, String string) {
    try {
      String result = DateFormat(string).format(date);
      return result;
    } catch (e) {
      return "--:--";
    }
  }
  
}
