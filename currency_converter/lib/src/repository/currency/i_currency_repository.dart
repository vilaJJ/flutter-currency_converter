import 'package:currency_converter/src/model/currency_model.dart';

abstract class ICurrencyRepository {
  Future<List<CurrencyModel>> getAll();
}
