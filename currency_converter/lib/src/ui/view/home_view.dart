import 'package:currency_converter/src/constants/assets_constants.dart';
import 'package:currency_converter/src/enum/currency_enum.dart';
import 'package:currency_converter/src/ui/controller/conversion_currency_field_controller.dart';
import 'package:currency_converter/src/ui/helper/screen_size_helper.dart';
import 'package:currency_converter/src/ui/viewmodel/home_view_model.dart';
import 'package:currency_converter/src/ui/widgets/conversion_currency_field.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    final imageSize = ScreenSizeHelper.of(context).getWidth(percentage: 0.6);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsConstants.appIcon,
              width: imageSize,
              height: imageSize,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ScreenSizeHelper.of(context).getHeight(
                percentage: 0.1,
              )),
              child: Column(
                children: [
                  ConversionCurrencyField(
                    controller: viewModel.leftCurrencyController,
                    onCurrencyChanged: (currency) => onCurrencyChanged(
                      viewModel.leftCurrencyController,
                      currency,
                    ),
                    onValueChanged: (value) async {
                      viewModel.leftCurrencyController.value = value;
                      await _refresh();
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 4,
                    ),
                  ),
                  ConversionCurrencyField(
                    controller: viewModel.rightCurrencyController,
                    onCurrencyChanged: (currency) async => await onCurrencyChanged(
                      viewModel.rightCurrencyController,
                      currency,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onCurrencyChanged(ConversionCurrencyFieldController controller, Currency currency) async {
    viewModel.setLastCurrencyChanged(controller);
    controller.currency = currency;
    await _refresh();
  }

  Future<void> _refresh() async {
    await viewModel.refresh();
    setState(() {});
  }
}
