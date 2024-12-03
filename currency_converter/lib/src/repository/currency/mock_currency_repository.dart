import 'package:currency_converter/src/enum/currency_enum.dart';
import 'package:currency_converter/src/model/currency_model.dart';
import 'package:currency_converter/src/repository/currency/i_currency_repository.dart';

class MockCurrencyRepository implements ICurrencyRepository {
  final List<CurrencyModel> _currencies = <CurrencyModel>[
    CurrencyModel(
      id: "769c69be-3f77-4f70-a296-294e486c711e",
      currency: Currency.real,
      conversions: {
        Currency.real: 1.0,
        Currency.dolar: 0.18,
        Currency.euro: 0.15,
        Currency.bitcoin: 0.000016,
      },
    ),
    CurrencyModel(
      id: "a2cec44a-0740-4fc7-a383-2c08a642cca7",
      currency: Currency.dolar,
      conversions: {
        Currency.real: 5.65,
        Currency.dolar: 1.0,
        Currency.euro: 0.85,
        Currency.bitcoin: 0.000088,
      },
    ),
    CurrencyModel(
      id: "72b7278f-f1ec-44c8-a68f-de6e62cbb8bd",
      currency: Currency.euro,
      conversions: {
        Currency.real: 5.62,
        Currency.dolar: 1.17,
        Currency.euro: 1.0,
        Currency.bitcoin: 0.0001,
      },
    ),
    CurrencyModel(
      id: "e9d86550-b385-49bd-a501-837bb8f66392",
      currency: Currency.bitcoin,
      conversions: {
        Currency.real: 64116.51,
        Currency.dolar: 11351.30,
        Currency.euro: 9689.54,
        Currency.bitcoin: 1.0,
      },
    ),
  ];

  @override
  Future<List<CurrencyModel>> getAll() async {
    return await Future.value(_currencies);
  }
}
