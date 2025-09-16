class QuoteData {
  final String premium;
  final String coverageDescription;
  final String currency;

  QuoteData({
    required this.premium,
    required this.coverageDescription,
    required this.currency,
  });

  factory QuoteData.fromJson(Map<String, dynamic> json) {
    return QuoteData(
      premium: json['premium'] as String,
      coverageDescription: json['coverage_description'] as String,
      currency: json['currency'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'premium': premium,
      'coverage_description': coverageDescription,
      'currency': currency,
    };
  }
}
