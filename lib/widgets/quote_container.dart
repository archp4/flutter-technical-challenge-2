import 'package:flutter/material.dart';
import 'package:insurance_quote_app/models/quote_api_data.dart';

class QuoteContainer extends StatelessWidget {
  final QuoteAPIData? quoteData;
  final VoidCallback onSave;
  const QuoteContainer({super.key, this.quoteData, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(quoteData == null ? 0 : 16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child:
          quoteData == null
              ? SizedBox()
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Premium: ${quoteData!.currency} ${quoteData!.premium}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Coverage: ${quoteData!.coverageDescription}',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
    );
  }
}
