import 'package:flutter/material.dart';

class QuoteForm extends StatelessWidget {
  const QuoteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Get a Quote'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.history))],
        ),

        body: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(decoration: InputDecoration(labelText: 'Full Name')),
                TextField(decoration: InputDecoration(labelText: 'Email')),
                TextField(
                  decoration: InputDecoration(labelText: 'Vehicel Make'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Vehicle Model'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Year of Manufacture'),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(onPressed: () {}, child: Text('SUBMIT')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
