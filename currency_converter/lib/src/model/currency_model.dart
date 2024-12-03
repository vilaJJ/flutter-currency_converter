import 'package:currency_converter/src/enum/currency_enum.dart';

class CurrencyModel {
  final String id;
  final Currency currency;
  final Map<Currency, double> conversions;

  CurrencyModel({
    required this.id,
    required this.currency,
    required this.conversions,
  });
}
