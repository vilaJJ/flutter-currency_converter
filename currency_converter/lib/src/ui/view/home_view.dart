import 'package:currency_converter/src/constants/assets_constants.dart';
import 'package:currency_converter/src/ui/widgets/conversion_currency_field.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Image.asset(
              AssetsConstants.appIcon,
              width: 200,
              height: 200,
            ),
            ConversionCurrencyField(),
            SizedBox(
              height: 15,
            ),
            ConversionCurrencyField(),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Converter')),
          ],
        ),
      ),
    );
  }
}
