import 'dart:math';

import 'package:dio/dio.dart';
import 'package:insurance_quote_app/models/quote_api_data.dart';

class ApiManager {
  static const String baseUrl = "https://689bfaf158a27b18087c94f4.mockapi.io";
  static const String quoteEndpoint = "/insuranceQuote";

  static final dio = Dio();

  static Future<QuoteAPIData> fetchQuote() async {
    // Random Number Between 1 - 10
    final index = Random().nextInt(10) + 1;

    try {
      // API Call
      final response = await dio.get('$baseUrl$quoteEndpoint/$index');
      // Check for Successful Response
      if (response.statusCode == 200) {
        return QuoteAPIData.fromJson(response.data);
      } else {
        // Handle Wrong Response
        throw Exception('Failed to load quote: ${response.statusCode}');
      }
    } catch (e) {
      // Handle Exception for Dio or Parsing
      throw Exception('Failed to load quote: $e');
    }
  }
}
