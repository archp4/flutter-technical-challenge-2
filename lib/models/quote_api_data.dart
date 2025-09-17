class QuoteAPIData {
  final String premium;
  final String coverageDescription;
  final String currency;

  QuoteAPIData({
    required this.premium,
    required this.coverageDescription,
    required this.currency,
  });

  factory QuoteAPIData.fromJson(Map<String, dynamic> json) {
    return QuoteAPIData(
      premium: json['premium'] as String,
      coverageDescription: json['coverageDescription'] as String,
      currency: json['currency'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'premium': premium,
      'coverageDescription': coverageDescription,
      'currency': currency,
    };
  }

  @override
  String toString() {
    return 'QuoteAPIData(premium: $premium, coverageDescription: $coverageDescription, currency: $currency)';
  }
}
