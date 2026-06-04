import 'package:intl/intl.dart';

String formatApiDate(DateTime date) {
  return "${date.year.toString().padLeft(4, '0')}-"
      "${date.month.toString().padLeft(2, '0')}-"
      "${date.day.toString().padLeft(2, '0')}"
      "T10:00:00Z";
}

String dateOnly(String dateTime) {
  final date = DateTime.parse(dateTime);

  return DateFormat('dd MMM yyyy', 'id_ID').format(date);
}

String formatRupiah(num value) {
return 'Rp ${NumberFormat.decimalPattern('id_ID').format(value)}';
}