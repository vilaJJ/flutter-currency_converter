import 'package:currency_converter/src/enum/currency_enum.dart';

class ConversionCurrencyFieldViewModel {
  List<Currency> getCurrencies() {
    return Currency.values;
  }
}
