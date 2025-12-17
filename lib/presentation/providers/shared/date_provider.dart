import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

final dateProvider = Provider<String>((ref) {
  return _getDate();
});

String _getDate() {
  // Initialize locale
  initializeDateFormatting('es');
  DateTime date = DateTime.now();
  final formatter = DateFormat('EEEE d', 'es');
  final humanReadableDate = formatter.format(date);
  final formattedDate =
      humanReadableDate[0].toUpperCase() + humanReadableDate.substring(1);
  return formattedDate;
}
