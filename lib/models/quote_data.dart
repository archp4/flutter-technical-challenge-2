class QuoteData {
  final String fullName;
  final String email;
  final String vehicleMake;
  final String vehicleModel;
  final String yearOfManufacture;
  final String premium;
  final String coverageDescription;
  final String currency;

  QuoteData({
    required this.fullName,
    required this.email,
    required this.vehicleMake,
    required this.vehicleModel,
    required this.yearOfManufacture,
    required this.premium,
    required this.coverageDescription,
    required this.currency,
  });

  factory QuoteData.fromJson(Map<String, dynamic> json) {
    return QuoteData(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      vehicleMake: json['vehicleMake'] as String,
      vehicleModel: json['vehicleModel'] as String,
      yearOfManufacture: json['yearOfManufacture'] as String,
      premium: json['premium'] as String,
      coverageDescription: json['coverageDescription'] as String,
      currency: json['currency'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'vehicleMake': vehicleMake,
      'vehicleModel': vehicleModel,
      'yearOfManufacture': yearOfManufacture,
      'premium': premium,
      'coverageDescription': coverageDescription,
      'currency': currency,
    };
  }

  @override
  String toString() {
    return 'QuoteData(fullName: $fullName, email: $email, vehicleMake: $vehicleMake, vehicleModel: $vehicleModel, yearOfManufacture: $yearOfManufacture, premium: $premium, coverageDescription: $coverageDescription, currency: $currency)';
  }
}
