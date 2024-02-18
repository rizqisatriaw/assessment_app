import 'package:intl/intl.dart';

extension DateStringFormat on String {
  String toGeneralDate() {
    // Parse the input string into a DateTime object
    DateTime dateTime = DateTime.parse(this);

    // Adjust the year
    dateTime = dateTime.subtract(const Duration(days: 365));

    // Format the date
    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);

    return formattedDate;
  }
}
