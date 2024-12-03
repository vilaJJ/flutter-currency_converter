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
  ),
  euro(
    acronym: "EUR",
    commercialName: "Euro",
    symbol: "€",
  ),
  dolar(
    acronym: "USD",
    commercialName: "Dollar",
    symbol: "\$",
  );

  const Currency({
    required this.acronym,
    required this.commercialName,
    required this.symbol,
  });

  final String acronym;
  final String commercialName;
  final String? symbol;
}
