import 'package:flutter/material.dart';
import 'package:insurance_quote_app/viewmodels/history_quote_view_model.dart';
import 'package:insurance_quote_app/viewmodels/quote_form_view_model.dart';
import 'package:insurance_quote_app/views/quote_form.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuoteFormViewModel()),
        ChangeNotifierProvider(create: (_) => HistoryQuoteViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Insurance Quote App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        ),
        home: const QuoteForm(),
      ),
    );
  }
}
