import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newpro/model/data_model.dart';
import 'package:newpro/screen/widgets/student_new.dart';

class ProviderDemo with ChangeNotifier {
  List<StudentModel> studentListNotifier = [];
  List<StudentModel> studentSearchResult = [];

  Future<void> addstudent(StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');

    studentListNotifier.add(value);
    await studentDB.put(value.id, value);
    notifyListeners();
  }

  Future<void> getAllstudent() async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentListNotifier.clear();

    studentListNotifier.addAll(studentDB.values);
    notifyListeners();
  }

  Future<void> deleteStudent(String id) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.delete(id);
    getAllstudent();
    notifyListeners();
  }

  openStudentDetials(BuildContext context, {required StudentModel student}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => StudentDetieeils(
          student: student,
        ),
      ),
    );
  }

  Future<void> updateStudent(StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.put(value.id, value);
    getAllstudent();
    notifyListeners();
  }

  Future editedfunction(BuildContext ctx, StudentModel value) async {
    final age = TextEditingController();
    final name = TextEditingController();
    final clas = TextEditingController();
    final address = TextEditingController();

    //defult textfieild = previo  sdtudet details
    age.text = value.age;
    name.text = value.name;
    address.text = value.address;
    clas.text = value.clas;

    await showDialog<String>(
      builder: (context) => SystemPadding(
        child: AlertDialog(
          contentPadding: const EdgeInsets.all(16.0),
          content: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: name,
                      autofocus: true,
                      decoration: const InputDecoration(hintText: 'Full Name'),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: age,
                      autofocus: true,
                      decoration: const InputDecoration(hintText: 'Age'),
                    ),
                    TextField(
                      controller: clas,
                      autofocus: true,
                      decoration: const InputDecoration(hintText: 'Class'),
                    ),
                    TextField(
                      controller: address,
                      autofocus: true,
                      decoration: const InputDecoration(hintText: 'address'),
                    ),
                  ],
                ),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            TextButton(
              child: const Text('UPDATE'),
              onPressed: () {
                final varible = StudentModel(
                    id: value.id,
                    name: name.text,
                    age: age.text,
                    clas: clas.text,
                    address: address.text);
                updateStudent(varible);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      context: ctx,
    );
  }
}

class SystemPadding extends StatelessWidget {
  final Widget child;

  const SystemPadding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300), child: child);
  }
}

List<StudentModel> serch(String nameserch, List<StudentModel> allstudent) {
  List<StudentModel> serchresult = [];

  serchresult = allstudent
      .where((element) =>
          element.name.toLowerCase().contains(nameserch.toLowerCase()))
      .toList();
  return serchresult;
}
