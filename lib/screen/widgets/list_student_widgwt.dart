import 'package:flutter/material.dart';
import 'package:newpro/db/function/db_function.dart';
import 'package:newpro/model/data_model.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            return GestureDetector(
              onTap: () {
                openStudentDetials(context, student: data);
              },
              child: ListTile(
                title: Text(data.name),
                subtitle: Text(data.age),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //delete icon button
                    IconButton(
                      iconSize: 24,
                      onPressed: () {
                        //alertboox

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Delete student?'),
                            content:
                                const Text('Do you want to delete the file?'),
                            actions: [
                              ElevatedButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text('No'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  deleteStudent(data.id.toString());
                                  Navigator.pop(context);
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),

                    // edite button
                    IconButton(
                      iconSize: 24,
                      onPressed: () {
                        editedfunction(
                          ctx,
                          StudentModel(
                              name: data.name,
                              age: data.age,
                              clas: data.clas,
                              address: data.address,
                              id: data.id),
                        );
                      },
                      icon: const Icon(Icons.edit,
                          color: Color.fromARGB(255, 80, 19, 172)),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: studentList.length,
        );
      },
    );
  }

 
}
