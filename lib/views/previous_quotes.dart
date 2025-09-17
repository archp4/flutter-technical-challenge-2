import 'package:flutter/material.dart';
import 'package:insurance_quote_app/viewmodels/history_quote_view_model.dart';
import 'package:provider/provider.dart';

class PreviousQuotes extends StatelessWidget {
  const PreviousQuotes({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HistoryQuoteViewModel>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Previous Quotes')),
        body:
            model.isLoading
                ? const Center(child: CircularProgressIndicator())
                : model.hasQuotes
                ? ListView(
                  padding: const EdgeInsets.all(16),
                  children: model.quoteTiles,
                )
                : const Center(child: Text('No previous quotes found')),
      ),
    );
  }
}
