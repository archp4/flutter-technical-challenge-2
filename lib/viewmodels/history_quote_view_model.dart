import 'package:flutter/material.dart';
import 'package:insurance_quote_app/helpers/preference_helper.dart';
import 'package:insurance_quote_app/widgets/history_tile.dart';

class HistoryQuoteViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<String> quotes = [];

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  HistoryQuoteViewModel() {
    initialize();
  }

  void initialize() async {
    setLoading(true);
    quotes = await PreferenceHelper.getData() ?? [];
    print("Loaded quotes: $quotes");
    setLoading(false);
  }

  get hasQuotes => quotes.isNotEmpty;

  get quoteTiles =>
      List.generate(quotes.length, (index) => HistoryTile(data: quotes[index]));

  void clearAllQuotes() async {
    await PreferenceHelper.clearData();
    quotes = [];
    notifyListeners();
  }
}
