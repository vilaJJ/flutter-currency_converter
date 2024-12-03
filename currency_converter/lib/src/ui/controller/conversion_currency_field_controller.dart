import 'package:currency_converter/src/enum/currency_converter_sides_enum.dart';
import 'package:currency_converter/src/enum/currency_enum.dart';

class ConversionCurrencyFieldController {
  ConversionCurrencyFieldController({
    required this.currency,
    required this.side,
    this.isReadOnly = false,
  });

  Currency currency;
  CurrencyConverterSides side;
  final bool isReadOnly;
  double? value;
}
