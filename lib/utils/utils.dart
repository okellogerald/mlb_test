import 'package:intl/intl.dart';

class Utils {
  static String getFormattedDate(DateTime date) =>
      DateFormat.yMd().format(date);
}
