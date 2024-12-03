class StringFormatter {
  StringFormatter._();

  static String toCurrencyWithoutMaxPrecision(double value) {
    if (value == 0) {
      return "0,00";
    }

    String valueStr = value.toString();
    List<String> valueSplit = valueStr.split(".");

    String firstPartValue = valueSplit[0];
    String result = "";

    int thousandIncrementCount = 0;

    for (int i = firstPartValue.length - 1; i >= 0; i--) {
      if (thousandIncrementCount > 2) {
        result = ".$result";
        thousandIncrementCount = 0;
      }

      result = firstPartValue[i] + result;
      thousandIncrementCount++;
    }

    result += ",";

    if (valueSplit.length > 1 && valueSplit[1] != "0") {
      final decimalPartValue = valueSplit[1];
      result += decimalPartValue;

      if (decimalPartValue.length < 2) {
        result += "0";
      }
    } else {
      result += "00";
    }

    return result;
  }
}
