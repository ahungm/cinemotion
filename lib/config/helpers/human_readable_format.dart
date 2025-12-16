import 'package:intl/intl.dart';

class HumanReadableFormat {
  static String formatNumber<T extends num>(T number) {
    // Local variable

    // TheMovieDB API returns numbers as decimals directly,
    // so it does not allow to attach 'K' or 'M' symbols
    final int correctedNumber = int.parse(
      number.toString().replaceAll('.', ''),
    );

    final String formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
      locale: 'en',
    ).format(correctedNumber);

    return formattedNumber;
  }
}
