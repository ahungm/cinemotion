import 'package:intl/intl.dart';

class HumanReadableFormat {
  static String formatNumber<T extends num>(T number, [int decimals = 0]) {
    // Local variable

    // TheMovieDB API returns numbers as decimals directly,
    // so it does not allow to attach 'K' or 'M' symbols
    final int correctedNumber = int.parse(
      number.toString().replaceAll('.', ''),
    );

    final String formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: decimals,
      symbol: '',
      locale: 'en',
    ).format(correctedNumber);

    return formattedNumber;
  }
}
