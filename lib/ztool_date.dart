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

  static int calculateRemainingMinutes(DateTime futureTime) {
    DateTime currentTime = DateTime.now();

    if (currentTime.isAfter(futureTime)) {
      return 0;
    }

    Duration remainingDuration = futureTime.difference(currentTime);
    int remainingMinutes = remainingDuration.inMinutes;

    return remainingMinutes;
  }

  static String convertMinutesToTimeString(int minutes) {
    int days = minutes ~/ (24 * 60);
    int hours = (minutes % (24 * 60)) ~/ 60;
    int remainingMinutes = minutes % 60;

    String timeString = '';

    if (days > 0) {
      timeString += '$days天';
    }

    if (hours > 0) {
      timeString += '$hours小时';
    }

    if (remainingMinutes > 0) {
      timeString += '$remainingMinutes分钟';
    }

    return timeString.trim();
  }
}
