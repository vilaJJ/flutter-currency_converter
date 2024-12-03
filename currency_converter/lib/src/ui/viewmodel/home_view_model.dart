import 'package:currency_converter/src/constants/currency_constants.dart';
import 'package:currency_converter/src/enum/currency_converter_sides_enum.dart';
import 'package:currency_converter/src/enum/currency_enum.dart';
import 'package:currency_converter/src/model/currency_model.dart';
import 'package:currency_converter/src/repository/currency/i_currency_repository.dart';
import 'package:currency_converter/src/repository/currency/mock_currency_repository.dart';
import 'package:currency_converter/src/ui/controller/conversion_currency_field_controller.dart';

class HomeViewModel {
  HomeViewModel() {
    setLastCurrencyChanged(leftCurrencyController);
  }

  final ICurrencyRepository _currencyRepository = MockCurrencyRepository();

  final ConversionCurrencyFieldController leftCurrencyController = ConversionCurrencyFieldController(
    currency: CurrencyConstants.defaultLeftCurrency,
    side: CurrencyConverterSides.left,
  );

  final ConversionCurrencyFieldController rightCurrencyController = ConversionCurrencyFieldController(
    currency: CurrencyConstants.defaultRightCurrency,
    side: CurrencyConverterSides.right,
    isReadOnly: true,
  );

  late Currency lastCurrencyChanged;
  late CurrencyConverterSides lastSideChanged;

  Future<void> refresh() async {
    _setCurrenciesField();

    final currency = await _getCurrencyByAcronym(leftCurrencyController.currency.acronym);
    final convertionPercentage = currency.conversions[rightCurrencyController.currency] ?? 0;
    final leftCurrencyValue = leftCurrencyController.value ?? 0;

    rightCurrencyController.value = leftCurrencyValue * convertionPercentage;
  }

  void setLastCurrencyChanged(ConversionCurrencyFieldController controller) {
    lastCurrencyChanged = controller.currency;
    lastSideChanged = controller.side;
  }

  void _setCurrenciesField() {
    if (leftCurrencyController.currency != rightCurrencyController.currency) {
      return;
    }

    if (lastSideChanged == CurrencyConverterSides.left) {
      rightCurrencyController.currency = lastCurrencyChanged;
    } else {
      leftCurrencyController.currency = lastCurrencyChanged;
    }
  }

  Future<CurrencyModel> _getCurrencyByAcronym(String acronym) async {
    return await _currencyRepository.getByAcronym(acronym);
  }
}
