import 'package:intl/intl.dart';

extension FormatterExtensions on double {
  String get currencyPTBR {
    final currencyformat =
        NumberFormat.currency(locale: "pt_br", symbol: r"R$");
    return currencyformat.format(this);
  }
}
