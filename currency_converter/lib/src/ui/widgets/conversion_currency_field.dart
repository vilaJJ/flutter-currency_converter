import 'package:currency_converter/src/enum/currency_converter_sides_enum.dart';
import 'package:currency_converter/src/enum/currency_enum.dart';
import 'package:currency_converter/src/ui/controller/conversion_currency_field_controller.dart';
import 'package:currency_converter/src/ui/viewmodel/conversion_currency_field_view_model.dart';
import 'package:currency_converter/src/utility/formatters/string_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class ConversionCurrencyField extends StatefulWidget {
  const ConversionCurrencyField({
    super.key,
    required this.controller,
    this.onValueChanged,
    required this.onCurrencyChanged,
  });

  final ConversionCurrencyFieldController controller;
  final void Function(double value)? onValueChanged;
  final Future<void> Function(Currency currency) onCurrencyChanged;

  @override
  State<ConversionCurrencyField> createState() => _ConversionCurrencyFieldState();
}

class _ConversionCurrencyFieldState extends State<ConversionCurrencyField> {
  final viewModel = ConversionCurrencyFieldViewModel();
  late final TextEditingController? textEditingController;

  @override
  void initState() {
    super.initState();

    textEditingController = widget.controller.isReadOnly
        ? null
        : MoneyMaskedTextController(
            precision: 2,
          );
  }

  TextEditingController? get alternativeTextEditingController {
    return widget.controller.isReadOnly
        ? TextEditingController(text: StringFormatter.toCurrencyWithoutMaxPrecision(widget.controller.value ?? 0))
        : MoneyMaskedTextController(
            precision: 2,
          );
  }

  @override
  Widget build(BuildContext context) {
    final currencies = viewModel.getCurrencies();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 2,
          child: DropdownButtonFormField<Currency>(
            value: widget.controller.currency,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            items: List.generate(
              currencies.length,
              (index) {
                final currency = currencies[index];

                return DropdownMenuItem(
                  value: currency,
                  child: Text(currency.presentationName),
                );
              },
            ),
            onChanged: (value) async {
              if (value == null) {
                return;
              }

              await widget.onCurrencyChanged(value);
            },
          ),
        ),
        Flexible(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextField(
              controller: textEditingController ?? alternativeTextEditingController,
              readOnly: widget.controller.isReadOnly,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                prefixText: "${widget.controller.currency.symbol ?? widget.controller.currency.acronym} ",
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (widget.onValueChanged == null || widget.controller.side != CurrencyConverterSides.left) {
                  return;
                }

                MoneyMaskedTextController textController = textEditingController as MoneyMaskedTextController;
                widget.onValueChanged!(textController.numberValue);
              },
            ),
          ),
        ),
      ],
    );
  }
}
