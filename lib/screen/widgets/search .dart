import 'package:flutter/material.dart';
import 'package:newpro/model/data_model.dart';
import 'package:newpro/screen/widgets/student_new.dart';
import '../../db/function/db_function.dart';

class Search extends StatelessWidget {
  Search({super.key});

  final nameserarchcotroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FocusNode srchFocus = FocusNode();
    srchFocus.requestFocus();
    ValueNotifier<List<StudentModel>> studentList = ValueNotifier([]);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: nameserarchcotroller,
          onChanged: (value) {
            studentList.value =
                serch(nameserarchcotroller.text, studentListNotifier.value);
            studentList.notifyListeners();

            //  print(":::::::Length:${studentList.value.length}::::");
          },
          focusNode: srchFocus,
          decoration: const InputDecoration(hintText: 'Search'),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: studentList,
        builder: (context, studentList, child) {
          return ListView.builder(
            itemCount: studentList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Student_Detieeils(
                        student: studentList[index],
                      ),
                    ),
                  );
                },
                title: Text(studentList[index].name),
              );
            },
          );
        },
      ),
    );
  }
}
