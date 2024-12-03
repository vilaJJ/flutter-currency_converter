enum Currency {
  real(
    acronym: "BRL",
    commercialName: "Real",
    symbol: "R\$",
  ),
  bitcoin(
    acronym: "BTC",
    commercialName: "Bitcoin",
    symbol: null,
    ignoreFormatters: true,
  ),
  euro(
    acronym: "EUR",
    commercialName: "Euro",
    symbol: "€",
  ),
  dollar(
    acronym: "USD",
    commercialName: "Dollar",
    symbol: "\$",
  );

  const Currency({
    required this.acronym,
    required this.commercialName,
    required this.symbol,
    this.ignoreFormatters = false,
  });

  final String acronym;
  final String commercialName;
  final String? symbol;
  final bool ignoreFormatters;

  String get presentationName {
    String value = acronym;

    if (symbol is String) {
      value += " ($symbol)";
    }

    return value;
  }
}
