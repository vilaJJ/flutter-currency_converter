import 'package:currency_converter/src/enum/currency_enum.dart';
import 'package:currency_converter/src/ui/viewmodel/conversion_currency_field_view_model.dart';
import 'package:flutter/material.dart';

class ConversionCurrencyField extends StatefulWidget {
  const ConversionCurrencyField({super.key});

  @override
  State<ConversionCurrencyField> createState() => _ConversionCurrencyFieldState();
}

class _ConversionCurrencyFieldState extends State<ConversionCurrencyField> {
  final viewModel = ConversionCurrencyFieldViewModel();

  @override
  Widget build(BuildContext context) {
    final currencies = viewModel.getCurrencies();

    return Row(
      children: [
        Flexible(
          flex: 1,
          child: DropdownButtonFormField<Currency>(
            items: List.generate(
              currencies.length,
              (index) {
                final currency = currencies[index];

                return DropdownMenuItem(
                  value: currency,
                  child: Text(currency.acronym),
                );
              },
            ),
            onChanged: (value) {},
          ),
        ),
        Flexible(
          flex: 2,
          child: TextField(),
        ),
      ],
    );
  }
}
