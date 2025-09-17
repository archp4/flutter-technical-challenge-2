import 'package:flutter/material.dart';
import 'package:insurance_quote_app/viewmodels/quote_form_view_model.dart';
import 'package:insurance_quote_app/widgets/quote_container.dart';
import 'package:provider/provider.dart';

class QuoteForm extends StatelessWidget {
  const QuoteForm({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<QuoteFormViewModel>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Get a Quote'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.history))],
        ),

        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: model.fullNameController,
                    decoration: InputDecoration(labelText: 'Full Name'),
                  ),
                  TextFormField(
                    controller: model.emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    controller: model.vehicleMakeController,
                    decoration: InputDecoration(labelText: 'Vehicle Make'),
                  ),
                  TextFormField(
                    controller: model.vehicleModelController,
                    decoration: InputDecoration(labelText: 'Vehicle Model'),
                  ),
                  Row(
                    children: [
                      Text('Year of Manufacture: '),
                      Spacer(),
                      TextButton(
                        onPressed: () async {
                          await model.selectYearOfManufacture(context);
                        },
                        child: Text(model.yearOfManufactureString),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => model.submitForm(context),
                    child: Text('SUBMIT'),
                  ),
                  QuoteContainer(quoteData: model.quoteData, onSave: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
