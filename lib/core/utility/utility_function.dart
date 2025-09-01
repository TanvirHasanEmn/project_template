import 'package:intl/intl.dart';

String formatAppointmentDate(String isoDate) {
  try {
    // Parse the ISO string into a DateTime object
    DateTime dateTime = DateTime.parse(isoDate);

    // Format to "Month Day, Year (Weekday)"
    String formattedDate = DateFormat('MMMM d, y (EEE)').format(dateTime);
    return formattedDate;
  } catch (e) {
    return 'Invalid Date';
  }
}

String convertToIso(String customDate) {
  try {
    // Remove the weekday part — e.g., "11 July, 2025 (Tue)" ➜ "11 July, 2025"
    String trimmedDate = customDate.split('(')[0].trim();

    // Parse the trimmed date using DateFormat
    DateFormat inputFormat = DateFormat("d MMMM, yyyy");
    DateTime date = inputFormat.parse(trimmedDate);

    // Set a default time (e.g., 09:16:34.523)
    DateTime dateTimeWithTime = DateTime(
      date.year,
      date.month,
      date.day,
      9, // hour
      16, // minute
      34, // second
      523, // millisecond
    );

    // Convert to UTC ISO 8601 string
    return dateTimeWithTime.toUtc().toIso8601String();
  } catch (e) {
    return "Invalid input date";
  }
}

String formatCustomTime(String timeString) {
  try {
    String corrected = timeString.replaceAll('.', ':');

    DateFormat inputFormat = DateFormat("hh:mm:ss a");
    DateTime time = inputFormat.parse(corrected);

    String formatted = DateFormat("h:mm a").format(time);
    return formatted;
  } catch (e) {
    return "Invalid time";
  }
}