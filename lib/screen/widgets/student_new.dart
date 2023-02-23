import 'package:flutter/material.dart';
import 'package:newpro/db/function/db_function.dart';
import 'package:newpro/model/data_model.dart';

// ignore: camel_case_types
class Student_Detieeils extends StatelessWidget {
  final StudentModel student;
  const Student_Detieeils({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          editedfunction(
              context, StudentModel(address: '', age: '', clas: '', name: ''));
        },
      ),
      body: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              'https://media.istockphoto.com/id/1142192548/vector/man-avatar-profile-male-face-silhouette-or-icon-isolated-on-white-background-vector.jpg?s=612x612&w=is&k=20&c=F3b3PaWVe3fW-LMQNptQq_DS44UnVk4TJS4nxSWHsxI=',
              width: 400,
            ),
            Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(20),
                width: 400,
                child: Text('Name: ${student.name}')),
            Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(20),
                width: 400,
                child: Text('Age: ${student.age}')),
            Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(20),
                width: 400,
                child: Text('Class: ${student.clas}')),
            Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(20),
                width: 400,
                child: Text('Adreess: ${student.address}')),
          ],
        ),
      ),
    );
  }
}
