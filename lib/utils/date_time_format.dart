import 'package:intl/intl.dart';

class DateTimeFormat {
  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm');

    return formatter.format(date);
  }
}
