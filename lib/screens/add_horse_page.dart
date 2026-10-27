import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/horse.dart';

class AddHorseScreen extends StatefulWidget {
  const AddHorseScreen({Key? key}) : super(key: key);

  @override
  State<AddHorseScreen> createState() => _AddHorseScreenState();
}

class _AddHorseScreenState extends State<AddHorseScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers to grab the text from the fields
  final _sellerController = TextEditingController();
  final _nameController = TextEditingController();
  final _breedController = TextEditingController();
  final _heightController = TextEditingController();
  final _descController = TextEditingController();

  Future<void> _saveHorse() async {
    if (_formKey.currentState!.validate()) {
      // 1. Create the Horse object
      final newHorse = Horse(
        sellerName: _sellerController.text,
        name: _nameController.text,
        breed: _breedController.text,
        height: _heightController.text,
        description: _descController.text,
      );

      // 2. Save to Firestore (ideally moved to a Repository class later)
      await FirebaseFirestore.instance
          .collection('horses')
          .add(newHorse.toFirestore());

      // 3. Clear the form and show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Horse added to catalogue!')),
      );
      Navigator.pop(context); // Go back to homepage
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a Horse')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _sellerController,
                decoration: const InputDecoration(labelText: "Seller's Name"),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Horse's Name"),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _breedController,
                decoration: const InputDecoration(labelText: 'Breed'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _heightController,
                decoration: const InputDecoration(labelText: 'Height (e.g., 16.2hh)'),
              ),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveHorse,
                child: const Text('Save Horse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}