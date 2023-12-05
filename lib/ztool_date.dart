import 'package:intl/intl.dart';
//日期格式化组件
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
