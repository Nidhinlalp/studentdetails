import 'package:flutter/material.dart';
import 'package:newpro/model/data_model.dart';
import 'package:newpro/view/widgets/student_new.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/state_managemant.dart';

class Search extends StatelessWidget {
  Search({super.key});

  final nameserarchcotroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<ProviderDemo>().setStudentSearchResult =
        context.read<ProviderDemo>().studentListNotifier;
    FocusNode srchFocus = FocusNode();
    srchFocus.requestFocus();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: nameserarchcotroller,
          onChanged: (value) {
            context.read<ProviderDemo>().setStudentSearchResult = serch(
                nameserarchcotroller.text,
                context.read<ProviderDemo>().studentListNotifier);
          },
          focusNode: srchFocus,
          decoration: const InputDecoration(hintText: 'Search'),
        ),
      ),
      body: Consumer<ProviderDemo>(
        builder: (BuildContext context, value, Widget? child) => Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 7.0,
            right: 7.0,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: value.studentSearchResult.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.grey.shade50.withOpacity(0.5),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => StudentDetieeils(
                          student: value.studentSearchResult[index],
                        ),
                      ),
                    );
                  },
                  title: Text(value.studentSearchResult[index].name),
                  subtitle: Text(value.studentSearchResult[index].age),
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
                                    Provider.of<ProviderDemo>(context,
                                            listen: false)
                                        .deleteStudent(value
                                            .studentSearchResult[index].id
                                            .toString());
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Row(
                                          children: const [
                                            Icon(Icons.check_circle_outline,
                                                color: Colors.red),
                                            SizedBox(width: 10),
                                            Text(
                                              'Successfuly deleted !',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        backgroundColor: Colors.white,
                                        elevation: 0,
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: const BorderSide(
                                              color: Colors.green),
                                        ),
                                        duration: const Duration(seconds: 1),
                                      ),
                                    );
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
                          Provider.of<ProviderDemo>(context, listen: false)
                              .editedfunction(
                            context,
                            StudentModel(
                              name: value.studentListNotifier[index].name,
                              age: value.studentListNotifier[index].age,
                              clas: value.studentListNotifier[index].clas,
                              address: value.studentListNotifier[index].address,
                              id: value.studentListNotifier[index].id,
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Color.fromARGB(255, 80, 19, 172),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
