import 'package:flutter/material.dart';
import 'package:insurance_quote_app/models/quote_data.dart';
import 'package:insurance_quote_app/viewmodels/quote_details_view_model.dart';
import 'package:provider/provider.dart';

class QuoteDetails extends StatelessWidget {
  final QuoteData data;
  const QuoteDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<QuoteDetailsViewModel>();
    return Scaffold(
      appBar: AppBar(title: const Text('Quote Confirmation')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name: ${data.fullName}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text('Email: ${data.email}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text(
              'Vehicle Make: ${data.vehicleMake}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Vehicle Model: ${data.vehicleModel}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Year of Manufacture: ${data.yearOfManufacture}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Quote Amount: ${data.currency} ${data.premium} / Year',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                model.saveQuote(data, context);
              },
              child: Text("Save Quote"),
            ),
          ],
        ),
      ),
    );
  }
}
