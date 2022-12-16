import 'package:flutter/material.dart';

import 'package:newpro/db/function/db_function.dart';
import 'package:newpro/model/data_model.dart';

class AddstudentWidget extends StatefulWidget {
  const AddstudentWidget({super.key});

  @override
  State<AddstudentWidget> createState() => _AddstudentWidgetState();
}

class _AddstudentWidgetState extends State<AddstudentWidget> {

  

  final _nameController = TextEditingController();

  final _ageControlageler = TextEditingController();

  final _clasControlageler = TextEditingController();

  final _addressControlageler = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'name',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
               validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your age';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              controller: _ageControlageler,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'age',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
               validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your class';
                }
                return null;
              },
              controller: _clasControlageler,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'class',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
               validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
              controller: _addressControlageler,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'address',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  onAddStudentButtonCliked();
                }
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Student'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onAddStudentButtonCliked() async {
    final name = _nameController.text.toString();
    final age = _ageControlageler.text.toString();
    final clas = _clasControlageler.text.toString();
    final address = _addressControlageler.text.toString();
    
    if (name.isEmpty || age.isEmpty||clas.isEmpty||address.isEmpty) {
    } else {
      StudentModel student = StudentModel(
          name: name,
          age: age,
          clas: clas,
          address: address,
          id: DateTime.now().millisecond.toString());
      addstudent(student);
    }
    // print('$_name $_age');
  }
  
}
