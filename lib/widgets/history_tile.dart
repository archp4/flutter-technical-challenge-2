import 'package:flutter/material.dart';
import 'package:insurance_quote_app/models/quote_data.dart';

class HistoryTile extends StatelessWidget {
  final String data;
  const HistoryTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    QuoteData quoteData = QuoteData.fromJsonString(data);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Name: ${quoteData.fullName}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Email: ${quoteData.email}",
              style: const TextStyle(fontSize: 18),
            ),

            Text(
              "${quoteData.vehicleMake} - ${quoteData.vehicleModel} (${quoteData.yearOfManufacture})",
              style: const TextStyle(fontSize: 18),
            ),
            Container(
              padding: EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Premium: ${quoteData.currency} ${quoteData.premium}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Coverage: ${quoteData.coverageDescription}',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
