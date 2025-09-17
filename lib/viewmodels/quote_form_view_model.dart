import 'package:flutter/material.dart';
import 'package:insurance_quote_app/helpers/api_manager.dart';
import 'package:insurance_quote_app/models/quote_api_data.dart';
import 'package:insurance_quote_app/models/quote_data.dart';
import 'package:insurance_quote_app/views/previous_quotes.dart';
import 'package:insurance_quote_app/views/quote_details.dart';

class QuoteFormViewModel extends ChangeNotifier {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _vehicleMakeController = TextEditingController();
  final _vehicleModelController = TextEditingController();
  DateTime? _yearOfManufactureController;
  QuoteAPIData? _lastQuoteData;

  QuoteAPIData? get quoteData => _lastQuoteData;
  TextEditingController get fullNameController => _fullNameController;
  TextEditingController get emailController => _emailController;

  String errorMessage = "";

  String? fullNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      errorMessage += 'Full Name is required\n';
    }
    return null;
  }

  void _setYearOfManufacture(DateTime year) {
    _yearOfManufactureController = year;
    notifyListeners();
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      errorMessage += 'Email is required\n';
      return null;
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      errorMessage += 'Enter a valid email address\n';
    }
    return null;
  }

  String? vehicleMakeValidator(String? value) {
    if (value == null || value.isEmpty) {
      errorMessage += 'Vehicle Make is required \n';
    }
    return null;
  }

  String? vehicleModelValidator(String? value) {
    if (value == null || value.isEmpty) {
      errorMessage += 'Vehicle Model is required\n';
    }
    return null;
  }

  bool isYearOfManufacture() {
    if (_yearOfManufactureController == null) {
      errorMessage += 'Year of Manufacture is required \n';
      return false;
    }
    errorMessage = errorMessage.replaceAll(
      'Year of Manufacture is required',
      '',
    );
    return true;
  }

  String get yearOfManufactureString =>
      isYearOfManufacture()
          ? _yearOfManufactureController!.year.toString()
          : 'Select Year';

  void clearForm() {
    fullNameController.clear();
    emailController.clear();
    _vehicleMakeController.clear();
    _vehicleModelController.clear();
    notifyListeners();
  }

  void setQuoteData(QuoteAPIData data) {
    _lastQuoteData = data;
    notifyListeners();
  }

  Widget get carMakeDropdown => DropdownButtonFormField<String>(
    decoration: const InputDecoration(
      labelText: 'Vehicle Make',
      border: OutlineInputBorder(),
    ),
    value:
        _vehicleMakeController.text.isNotEmpty
            ? _vehicleMakeController.text
            : null,
    items:
        carCompanies.map((String make) {
          return DropdownMenuItem<String>(value: make, child: Text(make));
        }).toList(),
    onChanged: (String? newValue) {
      _vehicleMakeController.text = newValue ?? '';
      notifyListeners();
    },
  );

  Widget get carModelDropdown => DropdownButtonFormField<String>(
    decoration: const InputDecoration(
      labelText: 'Vehicle Model',
      border: OutlineInputBorder(),
    ),
    value:
        _vehicleModelController.text.isNotEmpty
            ? _vehicleModelController.text
            : null,
    items:
        carTypes.map((String model) {
          return DropdownMenuItem<String>(value: model, child: Text(model));
        }).toList(),
    onChanged: (String? newValue) {
      _vehicleModelController.text = newValue ?? '';
      notifyListeners();
    },
  );

  Future<void> selectYearOfManufacture(BuildContext context) async {
    final DateTime? pickedYear = await showDialog(
      context: context,
      builder: (BuildContext context) {
        int baseYear = DateTime.now().year + 1;
        int selectedYear =
            isYearOfManufacture()
                ? _yearOfManufactureController!.year
                : baseYear;
        return AlertDialog(
          title: const Text('Select Year'),
          content: SizedBox(
            width: double.maxFinite,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(1980),
              lastDate: DateTime(baseYear),
              selectedDate: DateTime(selectedYear),
              onChanged: (DateTime dateTime) {
                selectedYear = dateTime.year;
                Navigator.of(context).pop(DateTime(selectedYear));
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('CANCEL'),
            ),
          ],
        );
      },
    );

    if (pickedYear != null) {
      _setYearOfManufacture(pickedYear);
    }
  }

  bool validateForm(BuildContext context) {
    errorMessage = "";
    fullNameValidator(fullNameController.text);
    emailValidator(emailController.text);
    vehicleMakeValidator(_vehicleMakeController.text);
    vehicleModelValidator(_vehicleModelController.text);
    isYearOfManufacture();

    if (errorMessage.isNotEmpty) {
      errorMessage = errorMessage.trim();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
      );

      return false;
    }

    return true;
  }

  void submitForm(BuildContext context) async {
    if (validateForm(context)) {
      try {
        var result = await ApiManager.fetchQuote();
        setQuoteData(result);
      } catch (e) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error fetching quote: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void toPreviousQuotes(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PreviousQuotes()),
    );
  }

  void onAppectQuote(context) {
    final data = QuoteData(
      fullName: fullNameController.text,
      email: emailController.text,
      vehicleMake: _vehicleMakeController.text,
      vehicleModel: _vehicleModelController.text,
      yearOfManufacture: _yearOfManufactureController!.year.toString(),
      premium: quoteData!.premium,
      coverageDescription: quoteData!.coverageDescription,
      currency: quoteData!.currency,
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => QuoteDetails(data: data)),
    );
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    _vehicleMakeController.dispose();
    _vehicleModelController.dispose();
    super.dispose();
  }
}

List<String> carCompanies = [
  "Toyota",
  "Honda",
  "Ford",
  "Chevrolet",
  "BMW",
  "Mercedes-Benz",
  "Audi",
  "Hyundai",
  "Kia",
  "Nissan",
  "Volkswagen",
  "Lexus",
  "Mazda",
  "Jeep",
  "Tesla",
];

List<String> carTypes = [
  "Sedan",
  "SUV",
  "Hatchback",
  "Convertible",
  "Coupe",
  "Pickup Truck",
  "Crossover",
  "Van",
  "Wagon",
  "Sports Car",
  "Luxury Car",
  "Electric Car",
  "Hybrid Car",
  "Diesel Car",
  "Off-Road Vehicle",
];
