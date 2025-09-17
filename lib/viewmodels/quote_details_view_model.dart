// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:insurance_quote_app/helpers/preference_helper.dart';
import 'package:insurance_quote_app/models/quote_data.dart';

class QuoteDetailsViewModel extends ChangeNotifier {
  void saveQuote(QuoteData data, BuildContext context) async {
    await PreferenceHelper.addData(JsonEncoder().convert(data.toJson()));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Quote saved successfully!')));
    Navigator.pop(context);
  }
}
